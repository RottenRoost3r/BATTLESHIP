require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"
require_relative "player.rb"



boards = {"b" => Grid.new(12), "i" => Grid.new(24), "e" => Grid.new(32)}

puts "Please select difficulty: Beginner [b], Intermediate [i], Expert[e]"
response = gets.chomp

board = ""

boards.each do |key, value|
    if response == key
        board = value
    end
end


def make_board(board)
    counter_top = 0
    print " "

    board.grid.each_with_index do |v, i|
        if counter_top < 10
            print "   #{counter_top}"
            counter_top += 1
        else
            print "  #{counter_top}"
            counter_top += 1
        end
    end

    puts "\n"
    counter_side = 0
    board.grid.each_with_index do |v, i|
        
        v.each_with_index do |k, i|
            if i == 0
                if counter_side < 10
                    print " #{counter_side} (#{k.to_s})"
                    counter_side += 1
                else # this extra if statement was just to satisfy my ocd, it's not actually neede, the game works fine without it, but the grid is offset past row 9 because the extra digit
                    print "#{counter_side} (#{k.to_s})"
                    counter_side += 1
                end
            elsif i == board.end_point
                print " (#{k.to_s}) \n"
            else
                print " (#{k.to_s})"
            end
        end
    end
end

make_board(board)

ships = {"Carrier" => Ship.new(5, "C"), "Battleship" => Ship.new(4, "B"), "Destroyer" => Ship.new(3, "D"), "Patrol" => Ship.new(2, "P")}

ships.each_with_index do |(key, value),index|
    puts "select the row you want your #{key} to start"
    row = gets.chomp
    puts "select the collumn you want your #{key} to start"
    col = gets.chomp
    puts "select orientation (horizontal [h], or vertical [v])"
    orientation = gets.chomp  

    redo if board.check_board(value, row.to_i, col.to_i, orientation) == false 
    redo if board.check_spaces(value, row.to_i, col.to_i, orientation) == false
    puts board.master(value, row.to_i, col.to_i, orientation) 
    make_board(board)
end
