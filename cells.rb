require_relative "boats.rb"
class Cell
    def initialize()
        @contents = "~"
        @coordinates = coordinates
        @status = "open"
    end

    def to_s
        @contents == "~" ? @contents : @contents.name
    end

    def occupy(ship)
        @contents = ship
        @status = "occupied"
    end

    def annex(ship)
        @status = "occupied"
        @contents = ship
    end

    def content()
        @contents
    end
    attr_reader :status
    attr_reader :contents
    attr_reader :coordinates
end

