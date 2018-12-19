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
puts "you have 4 ships"
puts "-----------------"
puts "carrier - 5 spaces"
puts "battleship - 4 spaces"
puts "cruiser - 3 spaces"
puts "destroyer - 2 spaces"
puts "----------------"

puts "please list the row you want your carrier to start"
row = gets.chomp
puts "please list the collumn you want your carrier to start"
col = gets.chomp
puts "witch direction do you want your ship to go? [horizontal] [vertical]"
direction = gets.chomp




puts board.check_board(Ship.new(5, "C"), row.to_i, col.to_i, direction)
make_board(board)







