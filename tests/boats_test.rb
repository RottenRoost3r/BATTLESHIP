require "minitest/autorun"
require_relative "../boats.rb"

class Boats < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_ship_exists
        x = Ship.new(4, "battleship")
        assert_equal(Ship, x.class)
    end

    def test_attributes
        x = Ship.new(4, "battleship")
        assert_equal("battleship", x.type?)
    end

    def test_attributes
        x = Ship.new(4, "battleship")
        assert_equal(4, x.length?)
    end

end