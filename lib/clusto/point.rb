module Clusto
  class Point
    attr_accessor :x, :y, :tag

    def initialize(x, y, tag=0)
      @x = x
      @y = y
      @tag = tag
    end
    
    def to_s
      return "(#{@x}, #{@y})"
    end
  end
end