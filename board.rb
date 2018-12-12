require_relative "cells.rb"
require_relative "boats.rb"

class Grid 
    def initialize(size=12)
        @grid = Array.new(size) {Array.new(size) {Cell.new()}}
        @end_point = size - 1
    end
    
    attr_reader :end_point
    attr_reader :grid
    attr_reader :size
end
