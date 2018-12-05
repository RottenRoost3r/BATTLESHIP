class Ship
    def initialize(length, name)
        @length = length
        @name = name
        @hits = 0
    end

    def type?
        return @name
    end

    def length?
        return @length
    end

    def take_hit()
        
    end

    attr_reader :length
    attr_reader :name
end