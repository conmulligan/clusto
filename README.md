Clusto
======

*Simple Ruby point clustering*

In a nutshell, Clusto is a simple way to assign many points to a few clusters, ideally for rendering on a map. It's an alternative to client-side clustering which can cause performance problems and typically necessitates code duplication if your data is used by different client-side languages or frameworks (JavaScript in the browser, Objective-C on iOS, Java on Android).

If you're familiar with the [k-means][1] algorithm then Clusto's clustering process should be broadly recognisable, although it does take some liberties in the name of performance.

Usage
-----

The `Clusto.cluster` method accepts an array of `Clusto::Point` values, and returns an array of `Clusto::Cluster` objects. Each cluster has one or more `Clusto::Point` values.


```ruby
points = data.map { |p| Clusto::Point.new(p.x, p.y) }
clusters = Clusto.cluster(points)
```

The `cluster` method also accepts a `:bounds` parameter, which will determine the initial cluster positions, and a `:grid_size` parameter, the square of which determines the number of clusters. By default, the `:bounds` is set to the minimum bounding rectangle of the supplied points and the `:grid_size` is set to `8`.

```ruby
bounds = [40.51, -74.39, 40.84, -73.44]
clusters = Clusto.cluster(points, :bounds => bounds, :grid_size => 10)
```

Each `point` is assigned to the nearest cluster using the [Haversine formula][2], but you can change the `:distance_method` to `:euclidian` if you wish:

```ruby
clusters = Clusto.cluster(points, :distance_method => :euclidian)
```

To keep track of points, you can assign each point an optional `tag` value:

```ruby
tag = 123
point = Clusto::Point(x, y, tag)
```

[1]: http://en.wikipedia.org/wiki/K-means_clustering
[2]: http://en.wikipedia.org/wiki/Haversine_formula