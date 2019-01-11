require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"

class Player
    def initialize(name)
        @name = name
        @board = Grid.new()
        @size = @board.size
        @carrier = Ship.new(5, carrier)
    end

    def to_s
        @name
    end

    attr_reader :board
    attr_reader :size
    attr_reader :carrier
    
end