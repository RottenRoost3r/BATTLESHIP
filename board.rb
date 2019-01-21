require_relative "cells.rb"
require_relative "boats.rb"
require_relative "enemy.rb"

class Grid 
    def initialize(size=12)
        @size = size
        @grid = Array.new(size) {Array.new(size) {Cell.new()}}
        @end_point = size - 1
    end
    
    def error()
        return "invalid placement"
    end

    def place_ship(ship, row, col, orientation)
       ship.length.times do
            if orientation == "horizontal" || orientation == "h"
                self.grid[row][col].occupy(ship)
                col += 1
            else
                self.grid[row][col].occupy(ship)
                row += 1
            end
        end
    end

    def place_enemy(ship, row, col, orientation)
        ship.length.times do
            if orientation == "horizontal" || orientation == "h"
                self.grid[row][col].annex(ship)
                col += 1
            elsif orientation = "vertical" || orientation == "v"
                self.grid[row][col].annex(ship)
                row += 1
            end
        end
    end

    def check_board(ship, row, col, orientation)
        if orientation == "horizontal" || orientation == "h"
            col + ship.length < grid.length && (col < grid.length && row < grid.length) ? true : false
        elsif orientation == "vertical" || orientation == "v"
            row + ship.length < grid.length && (col < grid.length && row < grid.length) ? true : false
        else
            false
        end
    end

    def check_spaces(ship, row, col, orientation)
        ship.length.times do
            if self.grid[row][col].status != "open"
                return false
            elsif orientation == "horizontal" || orientation == "h"
                col += 1
            elsif orientation = "vertical" || orientation == "v"
                row += 1
            end
        end
        return true
    end

    def master(ship, row, col, orientation)
        if check_board(ship, row, col, orientation) == true && check_spaces(ship, row, col, orientation) == true
            place_ship(ship, row, col, orientation)
        else
            error()
        end
    end
       
    def not_master(ship, row, col, orientation)
        if check_board(ship, row, col, orientation) == true && check_spaces(ship, row, col, orientation) == true
            place_enemy(ship, row, col, orientation)
        else
            error()
        end
    end

    def shots_fired(row, col)
        if row < @size && col < @size && row >= 0 && col >= 0
            self.grid[row][col].hit_that()
        else
            return "invalid"
        end
    end

    # def enemy_turn(grid)
    #     @coordinates = []
    #     num = []
    #     counter = 0
    #     grid.size.times do
    #         num << counter
    #         counter += 1
    #     end
    #     num.each do |row|
    #         num.each do |col|
    #             @coordinates << [row, col]
    #         end 
    #     end
    #     @possible_targets = @coordinates
    #     @target = @possible_targets.sample
    #     row = @target[0]
    #     col = @target[1]
    #     grid.shots_fired(row.to_i, col.to_i)
    #     system('cls')
    # end 

    attr_reader :end_point
    attr_reader :grid
    attr_reader :size
end

