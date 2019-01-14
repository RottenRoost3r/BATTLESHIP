require "minitest/autorun"
require_relative "../enemy.rb"

class Opponent < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_enemy_exists
        nme = Enemy.new(Grid.new(12))
        assert_equal(Enemy, nme.class)
    end

end