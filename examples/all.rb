require 'rubygems'
require 'processr'

# Setup

Processr.configure do |config|
  config.root = File.expand_path(File.dirname(__FILE__))
  config.out  = nil
end


puts "Simple text concatenation:"

processor = Processr.new
processor << "Some Text\n"
processor << "Some More Text"
puts processor.process!


puts "Simple text concatenation form files:"

processor = Processr.new
processor.files << File.join('..', 'spec', 'fixtures', 'one.txt')
processor.files << File.join('..', 'spec', 'fixtures', 'two.txt')
puts processor.process!


puts "Simple textile filter using input:"

TextileFilter = lambda do |buffer|
  
  lookup = {
    /_(.*)_/         => '<em>\1</em>',
    /\*(.*)\*/       => '<strong>\1</strong>',
    /\"(.*)\":(\S*)/ => '<a href="\2">\1</a>'
  }
  
  lookup.each_pair do |regex, replacement|
    buffer.gsub!(regex, replacement)
  end
  
  buffer
end

processor = Processr.new
processor.add_filter(TextileFilter)
processor << 'A _simple_ example of a "textile":http://www.textism.com/tools/textile/ parser using a *filter*.'
puts processor.process!
