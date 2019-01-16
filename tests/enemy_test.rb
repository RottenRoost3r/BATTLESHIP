require "minitest/autorun"
require_relative "../enemy.rb"

class Opponent < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_enemy_exists
        board = Grid.new(12)
        nme = Enemy.new(board)
        assert_equal(Enemy, nme.class)
        assert_equal(Grid, board.class)
        assert_equal(Array, nme.ships.class)
        assert_equal(144, nme.coordinates.length)
    end

    def test_targeting
        board = Grid.new(12)
        nme = Enemy.new(board)
        nme.fire()
        assert_equal(Array, nme.possible_targets.class)
        assert_equal(144, nme.possible_targets.length)
        assert_equal(Array, nme.target.class)
        assert_equal(2, nme.target.length)
    end

    

end