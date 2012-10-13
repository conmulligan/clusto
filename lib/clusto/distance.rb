module Clusto
  class Distance
    def self.euclidian(pa, pb)
      Math::sqrt((pa.x - pb.x) ** 2 + (pa.y - pb.y) ** 2)
    end
    
    def self.haversine(pa, pb)
      x = (pb.x - pa.x) * RADIANS_PER_DEGREES
      y = (pb.y - pa.y) * RADIANS_PER_DEGREES
      
      ar = pa.x * RADIANS_PER_DEGREES
      br = pb.x * RADIANS_PER_DEGREES
      
      a = Math.sin(x / 2) ** 2 + Math.cos(ar) * Math.cos(br) * Math.sin(y / 2) ** 2
      c = 2 * Math.atan2(Math::sqrt(a), Math::sqrt(1 - a))
      GREAT_CIRCLE_RADIUS * c;
    end
  end
end