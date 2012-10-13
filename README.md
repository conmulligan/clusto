Clusto
======

*Simple Ruby point clustering*

If you're familiar with the [k-means][1] algorithm then Clusto's clustering process will probably be broadly recognisable, although it does take some liberties in the name of performance.

Usage
-----

```ruby
points = data.map { |p| Clusto::Point.new(p.x, p.y) }
clusters = Clusto.cluster(points)
```

[1]: http://en.wikipedia.org/wiki/K-means_clustering