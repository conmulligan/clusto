require 'clusto/point'
require 'clusto/cluster'
require 'clusto/distance'

module Clusto
  extend self

  INFINITY = +1.0/0
  RADIANS_PER_DEGREES = Math::PI / 180
  GREAT_CIRCLE_RADIUS = 6371
  
  DEFAULT_GRID_SIZE = 8

  def minimum_bounding_rectangle(points)
    xs = points.collect { |p| p.x }.minmax
    ys = points.collect { |p| p.y }.minmax
    
    [xs[0], ys[0], xs[1], ys[1]]
  end
  
  def cluster(points, options={})
    bounds = options[:bounds] || Clusto.minimum_bounding_rectangle(points)
    distance_method = options[:distance_method] || :haversine
    grid_size = options[:grid_size] || DEFAULT_GRID_SIZE
    
    # Create clusters
    
    clusters = []
    
    x = bounds[0]
    y = bounds[3]
    w = bounds[2] - bounds[0]
    h = bounds[3] - bounds[1]
    grid_w = w / grid_size
    grid_h = h / grid_size
    
    column = 0
    row = 0
    
    (grid_size ** 2).times do |i|
      offset_x = x + (column * grid_w)
      offset_y = y - (row * grid_h)
      
      center = Clusto::Point.new(offset_x + (grid_w / 2), offset_y - (grid_h / 2))
      clusters.push(Clusto::Cluster.new(center))
      
      column = column+1
      if column == grid_size
        column = 0
        row = row+1
      end
    end
    
    # Assign points to clusters
    
    points.each do |point|
      distance = INFINITY
      nearest = nil

      clusters.each do |cluster|
        begin
          d = Clusto::Distance.send(distance_method, cluster.location, point)
        rescue NoMethodError
          raise "Unknown distance method '#{distance_method}."
        end
        
        if d < distance
          distance = d
          nearest = cluster
        end
      end

      nearest.points.push(point)
    end

    # Reposition clusters
    
    clusters.each { |c| c.reposition }
  end
end