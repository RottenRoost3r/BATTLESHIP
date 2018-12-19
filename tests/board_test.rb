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
        assert_equal("tugboat", board.grid[row][col].to_s())
    end

    def test_ship_placement_2
        board = Grid.new
        row = 5
        col = 5
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("tugboat", board.grid[5][5].to_s())
        assert_equal("tugboat", board.grid[5][6].to_s())
    end

    def test_invalid_placement
        board = Grid.new
        row = 11
        col = 22
        assert_equal("invalid placement", board.check_board(Ship.new(5,"tugboat"), row, col, "horizontal"))
    end

   
end
