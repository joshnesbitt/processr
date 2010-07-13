require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'processr'))

Processr.configure do |config|
  config.root = File.expand_path(File.dirname(__FILE__))
  config.out  = File.join(config.root, 'output.txt')
end



# Simple text concatenation.

processor = Processr.new
processor << 'one.txt'
processor << 'two.txt'
processor.process!



# Simple textile filter.

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
processor << 'text.textile'
processor.process!

puts "* Look in output.txt to see the result of this example."
