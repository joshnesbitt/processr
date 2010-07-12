require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'processr'))

Processr.configure do |config|
  config.root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  config.out  = File.join(config.root, 'examples', 'all')
end

puts "* Processing"

# Simple text concatenation.

processor = Processr.new
processor << File.join('spec', 'fixtures', 'one.js')
processor << File.join('spec', 'fixtures', 'two.js')
processor.process!

puts "* Done!"
