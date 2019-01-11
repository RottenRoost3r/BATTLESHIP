require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"

class Player
    def initialize(name)
        @name = name
        @board = Grid.new()
        @size = @board.size
    end

    def to_s
        @name
    end

    attr_reader :board
    attr_reader :size
    
end