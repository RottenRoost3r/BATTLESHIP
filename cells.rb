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

    def occupy()
        @contents = "ship"
        @status = "occupied"
    end

    def content()
        @contents
    end
    attr_reader :status
    attr_reader :contents
    attr_reader :coordinates
end