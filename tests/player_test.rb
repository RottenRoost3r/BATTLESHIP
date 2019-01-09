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
end