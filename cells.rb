require_relative "master.rb"

class Cell
    def initialize(coordinates)
        @contents = contents
        @coordinates = coordinates
    end
    attr_reader :contents
    attr_reader :coordinates
end