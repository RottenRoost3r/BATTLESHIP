require_relative "master.rb"

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
        @hits += 1
        if @hits == @length
            return "#{name.capitalize} Destroyed!"
        else 
            return "You Hit a Ship!"
        end
    end

    attr_reader :length
    attr_reader :name
end