require "minitest/autorun"
require_relative "../player.rb"

class Players < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_player_exists
        me = Player.new("jordan")
        assert_equal(Player, me.class)
    end

    def test_player_name
        me = Player.new("jordan")
        assert_equal("jordan", me.to_s)
    end

    def test_player_has_board
        me = Player.new("jordan")
        assert_equal(12, me.size)
    end

    def test_player_has_ship
        me = Player.new("jordan")
        assert_equal(5, me.carrier.length?())
        assert_equal(4, me.battleship.length?())
        assert_equal(3, me.destroyer.length?())
        assert_equal(2, me.patrol.length?())
    end
end