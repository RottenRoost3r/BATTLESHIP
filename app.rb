require 'sinatra'
require_relative 'board.rb'
require_relative 'boats.rb'
require_relative 'cells.rb'
require_relative 'enemy.rb'
use Rack::Session::Pool, :expire_after => 60 * 1

get '/' do

  erb :open
end

post '/' do
  session[:board] = Grid.new(params[:size].to_i)
  session[:nme_board] = Grid.new(params[:size].to_i)
  p "RIGHT HERE#{session[:board]}"
  redirect '/board'
end

get '/board' do
  board = session[:board]
  nme_board = session[:nme_board]
  erb :board, locals: {board: board, nme_board: nme_board}
end

post '/board' do
  session[:nme_board] = params[:nme_board]
  session[:board] = params[:board]
  redirect '/board'
end

