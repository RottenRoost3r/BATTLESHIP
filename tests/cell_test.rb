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

    def test_if_got_hit_changes_status
        x = Cell.new
        x.got_hit
        assert_equal("X", x.content())
    end

    def test_if_missed_changes_status
        x = Cell.new
        x.missed
        assert_equal("O", x.content())
    end
end
