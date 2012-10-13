module Clusto
  class Cluster
    attr_accessor :location, :points
  
    def initialize(location)
      @location = location
      @points = []
    end
  
    def reposition
      return if @points.empty?
      
      x = 0
      y = 0
      center = @location
      
      @points.each do |point|
        x += point.x
        y += point.y
      end

      x /= points.length
      y /= points.length
  
      @location = Clusto::Point.new(x, y)
    end
  end
end