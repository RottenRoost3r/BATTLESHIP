require "minitest/autorun"
require_relative "../boats.rb"

class Boats < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_ship_exists
        x = Ship.new
        assert_equal(Ship, x.class)
    end

end