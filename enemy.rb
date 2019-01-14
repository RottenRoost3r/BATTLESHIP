require_relative "boats.rb"
require_relative "board.rb"

class Enemy
    def initialize(grid)
        @ships = ["Carrier" => Ship.new(5, "C"), "Battleship" => Ship.new(4, "B"), "Destroyer" => Ship.new(3, "D"), "Patrol" => Ship.new(2, "P")]
        grid.size.times do
            puts grid
        end
    end
    attr_reader :grid
    attr_reader :ships
    
end