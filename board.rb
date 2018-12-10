require_relative "cells.rb"
require_relative "boats.rb"

class Grid 
    def initialize(size=12)
        @grid = Array.new(size) {Array.new(size, Cell.new().to_s)}
    end

    attr_reader :grid
    attr_reader :size
end

o = Grid.new(3)
o.grid.each do |v|
    p v
end