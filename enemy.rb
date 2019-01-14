require_relative "boats.rb"
require_relative "board.rb"

class Enemy
    def initialize(grid)
        grid.size.times do
            puts grid
        end
    end
    attr_reader :grid
    
end