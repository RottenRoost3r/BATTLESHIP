require_relative "boats.rb"
require_relative "board.rb"
require_relative "cells.rb"


class Enemy
    def initialize(grid)
        @grid = grid
        num = []
        @coordinates = []
        @ships = [Ship.new(5, "C"), Ship.new(4, "B"), Ship.new(3, "D"), Ship.new(2, "P")]
        counter = 0
        grid.size.times do
            num << counter
            counter += 1
        end
        num.each do |row|
            num.each do |col|
                @coordinates << [row, col]
            end 
        end
    end

    def place_ships()
        counter = 0
        4.times do
            while true
                possible = @coordinates
                on_hold = possible.sample
                orientations = ["horizontal", "vertical"]
                if @grid.not_master(@ships[counter], on_hold[0], on_hold[1], orientations.sample) != "invalid placement"
                    counter += 1
                    possible.delete(on_hold)
                    break
                end
            end
        end
    end

    
    def enemy_turn(grid, coordinates)
        @target = coordinates.sample
        row = @target[0]
        col = @target[1]
        @coordinates.delete(@target)
        grid.shots_fired(row.to_i, col.to_i)
        @target = @coordinates.sample

    end 

    attr_reader :grid
    attr_reader :ships
    attr_reader :coordinates
    attr_reader :target 
end