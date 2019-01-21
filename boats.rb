
class Ship
    def initialize(length, name)
        @length = length
        @name = name
    end

    def type?()
        return @name
    end

    def length?
        return @length
    end
    attr_reader :length
    attr_reader :name
end