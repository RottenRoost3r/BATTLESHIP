
class Cell
    def initialize(coordinates)
        @contents ||= "Water"
        @coordinates = coordinates
    end

    def to_s
        @contents
    end
    attr_reader :contents
    attr_reader :coordinates
end