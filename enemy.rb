require_relative "boats.rb"
require_relative "board.rb"

class Enemy
    def initialize(grid)
        num = []
        @coordinates = []
        @ships = ["Carrier" => Ship.new(5, "C"), "Battleship" => Ship.new(4, "B"), "Destroyer" => Ship.new(3, "D"), "Patrol" => Ship.new(2, "P")]
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

    attr_reader :grid
    attr_reader :ships
    attr_reader :coordinates
    
end