require_relative "boats.rb"
class Cell
    def initialize()
        @contents = "~"
        @coordinates = coordinates
    end

    def to_s
        @contents == "~" ? @contents : @contents.name
    end

    def content()
        @contents
    end
    attr_reader :contents
    attr_reader :coordinates
end