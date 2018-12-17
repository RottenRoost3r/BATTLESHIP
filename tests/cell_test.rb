require "minitest/autorun"
require_relative "../cells.rb"

class Cells < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_content_checker
        x = Cell.new
        assert_equal("~", x.content())
    end
end
