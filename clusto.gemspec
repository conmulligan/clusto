Gem::Specification.new do |s|
  s.name        = 'clusto'
  s.version     = '0.2.0'
  s.author      = 'Conor Mulligan'
  s.email       = 'conmulligan@gmail.com'
  s.homepage    = 'http://github.com/conmulligan/clusto'
  s.summary     = 'Simple Ruby point clustering'
  s.description = 'Clusto is a simple way to assign many points to a few clusters, ideally for rendering on a map.'
  s.license     = 'MIT'
  
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.1'
  s.files = Dir["#{File.dirname(__FILE__)}/**/*"]
end
