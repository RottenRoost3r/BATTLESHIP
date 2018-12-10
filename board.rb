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

o = Grid.new(5)
 o.grid[1][1].occupy(Ship.new(4, "Ship "))
 o.grid[1][2].occupy(Ship.new(4, "Ship "))
 o.grid[1][3].occupy(Ship.new(4, "Ship "))
 o.grid[1][4].occupy(Ship.new(4, "Ship "))
o.grid.each do |v|
    v.each_with_index do |k, i|
        if i == o.end_point
            print "|#{k.to_s}| \n"
        else
            print "|#{k.to_s}|"
        end
    end
end