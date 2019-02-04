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
  session[:board] = Grid.new(params[:size].to_i)
  session[:nme_board] = Grid.new(params[:size].to_i)
  redirect '/board'
end

get '/board' do
  board = session[:board]
  nme_board = session[:nme_board]
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  orientation = session[:orientation].to_s || ""
  erb :board, locals: {board: board, nme_board: nme_board, row: row, col: col, orientation: orientation}
end

post '/board' do
  session[:err] = ""
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:orientation] = params[:orientation]
  ships = [carrier = Ship.new(5, "(C)"), battleship = Ship.new(4, "(B)"), destroyer = Ship.new(3, "(D)"), patrol = Ship.new(2, "(P)")]
  redirect '/board'
end

