require_relative "boats.rb"
class Cell
    def initialize()
        @contents = "Water"
        @coordinates = coordinates
    end

    def to_s
        @contents == "Water" ? @contents : @contents.name
    end

    def occupy(ship)
        @contents = ship
    end
    attr_reader :contents
    attr_reader :coordinates
end