require_relative "cells.rb"
require_relative "boats.rb"

class Grid 
    def initialize(size=12)
        @grid = Array.new(size) {Array.new(size, "")}
    end

    attr_reader :grid
    attr_reader :size
end

o = Grid.new(3)
p 'poop'
p o.grid