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
        assert_equal(false, board.check_board(Ship.new(5,"tugboat"), row, col, "horizontal"))
    end

    def test_ship_on_ship
        board = Grid.new
        row = 1
        col = 1
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal(false, board.check_spaces(Ship.new(5,"tugboat"), row, col, "horizontal"))
    end

    def test_master
        board = Grid.new
        row = 1
        col = 1
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("invalid placement", board.master(Ship.new(5,"tugboat"), row, col, "horizontal"))
        assert_equal("invalid placement", board.master(Ship.new(5,"tugboat"), row, 22, "horizontal"))
    end

    def test_master_2
        board = Grid.new
        row = 1
        col = 1
        board.master(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("tugboat", board.grid[1][1].to_s())
    end

    def test_firing_shot
        board = Grid.new
        row = 1
        col = 1
        board.shots_fired(row, col)
        assert_equal("O", board.grid[1][1].to_s())
    end

    def test_invalid_shot
        board = Grid.new(12)
        row = 14
        col = 14
        assert_equal("invalid", board.shots_fired(row, col))
    end

    def test_end_checker
        board = Grid.new(12)
        nme_board = Grid.new(12)
        nme = Enemy.new(nme_board)
        row = 1
        col = 1
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("YOU WIN!", board.end_checker(board, nme_board))
    end

    def test_end_checker_2
        board = Grid.new(12)
        nme_board = Grid.new(12)
        nme = Enemy.new(nme_board)
        row = 1
        col = 1
        nme_board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal("YOU LOSE!", board.end_checker(board, nme_board))
    end

    def test_end_checker_3
        board = Grid.new(12)
        nme_board = Grid.new(12)
        nme = Enemy.new(nme_board)
        row = 1
        col = 1
        nme_board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        board.place_ship(Ship.new(5,"tugboat"), row, col, "horizontal")
        assert_equal(true, board.end_checker(board, nme_board))
    end

   
end
