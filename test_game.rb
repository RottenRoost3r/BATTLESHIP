require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"

puts "please select difficulty beginner [b], intermediate [i], expert[e]"
response = gets.chomp

if response == "b"
    board = Grid.new(12)
elsif response == "i"
    board = Grid.new(24)
elsif response == "e"
    board = Grid.new(36)
else
    puts "please enter one of the listed options"
end
board.grid[1][1].occupy(Ship.new(4, "B"))
board.grid[1][2].occupy(Ship.new(4, "B"))
board.grid[1][3].occupy(Ship.new(4, "B"))
board.grid[1][4].occupy(Ship.new(4, "B"))
board.grid.each do |v|
    v.each_with_index do |k, i|
        if i == board.end_point
            print "(#{k.to_s}) \n"
        else
            print "(#{k.to_s})"
        end
    end
end

