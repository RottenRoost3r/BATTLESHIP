require "minitest/autorun"
require_relative "../board.rb"

class Board < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_ship_placement
        board = Grid.new
        row = 1
        col = 1
        board.place_ship(Ship.new(1,"tugboat"), row, col, "horizontal")
        assert_equal("ship", board.grid[row][col].content())
    end

    def test_ship_placement_2
        board = Grid.new
        row = 5
        col = 5
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("ship", board.grid[row][col].content())
        assert_equal("ship", board.grid[5][6].content())
    end
end
