require_relative "cells.rb"
require_relative "boats.rb"

class Grid 
    def initialize(size=12)
        @grid = Array.new(size) {Array.new(size) {Cell.new()}}
        @end_point = size - 1
    end

    
    
    def place_ship(ship, row, col, orientation)
       ship.length.times do
            if orientation == "horizontal"
                self.grid[row][col].occupy(ship)
                col += 1
            else
                self.grid[row][col].occupy(ship)
                row += 1
            end
        end
    end

    attr_reader :end_point
    attr_reader :grid
    attr_reader :size
end