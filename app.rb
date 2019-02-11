require 'sinatra'
require_relative 'board.rb'
require_relative 'boats.rb'
require_relative 'cells.rb'
require_relative 'enemy.rb'
use Rack::Session::Pool

get '/' do

  erb :open
end

post '/' do
  session.clear
  session[:board] = Grid.new(params[:size].to_i)
  session[:nme_board] = Grid.new(params[:size].to_i)
  session[:enemy] = Enemy.new(session[:nme_board])
  session[:err] = ""
  redirect '/board'
end

get '/board' do
  hitter = session[:hitter] || ""
  board = session[:board]
  nme_board = session[:nme_board]
  ship_num = session[:increase] || 0
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  orientation = session[:orientation].to_s || ""

  
 
  if session[:err] != "invalid placement"
    board.master(session[:place_ship], row, col, orientation) if orientation != ""
  end

  if session[:increase] == 4
    session[:enemy].place_ships()
  end

  if session[:increase] == 4
    ship_num += 1
  end
  erb :board, locals: {board: board, nme_board: nme_board, row: row, col: col, orientation: orientation, ship_num: ship_num, err: session[:err], hitter: hitter}
end

post '/board' do
  coordinates = session[:enemy].coordinates
  session[:err] = ""
  session[:increase] = params[:ship_num].to_i
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:orientation] = params[:orientation]

  coords = params[:grid_cell] || []
  p coords
  if coords != []
    p coords
     coords = coords[0].delete "[]"
     p coords
      coords = coords.split(",")
     session[:row] = coords[0]
     p "HERE IS THE ROW #{session[:row]}"
     session[:col] = coords[1]
     p "HERE IS THE COL #{session[:col]}"
  end
  p coords
  ships = [carrier = Ship.new(5, "(C)"), battleship = Ship.new(4, "(B)"), destroyer = Ship.new(3, "(D)"), patrol = Ship.new(2, "(P)")]
  if session[:board].master(ships[session[:increase]], session[:row].to_i, session[:col].to_i, params[:orientation].to_s) != "invalid placement"
    session[:place_ship] = ships[session[:increase]]
    session[:increase] += 1
  else
    session[:err] = "invalid placement"
  end

  if session[:increase] > 4
    session[:hitter] = session[:nme_board].shots_fired(session[:row].to_i, session[:col].to_i)
    if session[:hitter] == "invalid"  
      session[:err] = "invalid shot"
    else
      session[:enemy].enemy_turn(session[:board], coordinates)
    end
  end

  redirect '/board'
end

