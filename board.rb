require_relative "cells.rb"
require_relative "boats.rb"

class Grid 
    def initialize(size=12)
        @grid = Array.new(size) {Array.new(size) {Cell.new()}}
        @end_point = size - 1
    end
    
    attr_reader :end_point
    attr_reader :grid
    attr_reader :size
end

board = Grid.new(12)
counter = 1
letters = ('A'..'Z').to_a
print "-"
board.grid.each_with_index do |v, i|
    
    print "   #{letters[i]}"
end
puts "\n"

board.grid.each_with_index do |v, i|
    v.each_with_index do |k, i|
        if i == 0
            if counter < 10
                print " #{counter} (#{k.to_s})"
                counter += 1
            else counter    # this extra if statement was just to satisfy my ocd, it's not actually neede, the game works fine without it, but the grid is offset past row 9 because the extra digit
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