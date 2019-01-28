require 'sinatra'
require_relative 'board.rb'
require_relative 'boats.rb'
require_relative 'cells.rb'
require_relative 'enemy.rb'
enable :sessions

get '/' do
  session[:size] = params[:size]
  size = session[:size]
  erb :open, locals: {size: size}
end

post '/board' do
  session[:size] = params[:size]
  redirect '/board'
end

get '/board' do
  params[:size] = session[:size]
  board = Grid.new(session[:size].to_i)
  p board
  p session[:size]
  params[:board] = board
  erb :board, locals: {board: board}
end
