require "minitest/autorun"
require_relative "../board.rb"

class Board < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_ship_placement
        board = Grid.new
        board.place_ship()
        assert_equal("ship", board.grid[1][5].content())
    end
end
