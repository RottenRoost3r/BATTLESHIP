require_relative "boats.rb"
class Cell
    def initialize()
        @contents = "~"
        @coordinates = coordinates
        @status = "open"
    end

    def to_s
        if @contents.class == Ship 
            @contents.name
        else
            @contents
        end
    end

    def hit_that
        if @contents == "occupied"
            @contents.take_hit()
            @contents = "X"
            @status = "dead"
        else 
            @contents = "O"
            @status = "open"
        end
    end

    def occupy(ship)
        @contents = ship
        @status = "occupied"
    end

    def annex(ship)
        @status = "occupied"
        #uncomment line below to see enemy ships
        # @contents = ship
    end

    def content()
        @contents
    end
    attr_reader :status
    attr_reader :contents
    attr_reader :coordinates
end

