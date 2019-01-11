require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"

class Player
    def initialize(name)
        @name = name
        @board = Grid.new()
        @size = @board.size
        @carrier = Ship.new(5, carrier)
        @battleship = Ship.new(4, battleship)
        @destroyer = Ship.new(3, destroyer)
        @patrol = Ship.new(2, patrol)
    end

    def to_s
        @name
    end

    attr_reader :board
    attr_reader :size
    attr_reader :carrier
    attr_reader :battleship
    attr_reader :destroyer
    attr_reader :patrol
    
end