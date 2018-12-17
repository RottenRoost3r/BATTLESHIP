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

counter = 1
letters = ('A'..'Z').to_a
print " "

board.grid.each_with_index do |v, i|
    if i < 26
        print "   #{letters[i]}"
    else 
        print "   #{letters[i - 26]}".downcase
    end
end

puts "\n"

board.grid.each_with_index do |v, i|
    v.each_with_index do |k, i|
        if i == 0
            if counter < 10
                print " #{counter} (#{k.to_s})"
                counter += 1
            else # this extra if statement was just to satisfy my ocd, it's not actually neede, the game works fine without it, but the grid is offset past row 9 because the extra digit
                print "#{counter} (#{k.to_s})"
                counter += 1
            end
        elsif i == board.end_point
            print " (#{k.to_s}) \n"
        else
            print " (#{k.to_s})"
        end
    end
end

puts "you have 5 ships"
puts "-----------------"
puts "carrier - 5 spaces"
puts "battleship - 4 spaces"
puts "cruiser - 3 spaces"
puts "destroyer - 2 spaces"
puts "----------------"

puts "please list the space you want your carrier to start"
start = gets.chomp
puts "witch direction do you want your ship to go? [up] [down] [left] [right]"
direction = gets.chomp




