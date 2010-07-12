require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'processr'))

# Compresses all assets into a single JS file.

class Compressor
  class << self
    def root=(path); @path = path; end
    def root; @path; end

    def output_file=(path); @output_file = path; end
    def output_file; @output_file; end
  end
  
  attr_accessor :buffer
  
  def initialize
    self.buffer = ""
  end
  
  def compress!
    write_buffer_to_file!
    true
  end
  
  def <<(file)
    self.buffer << File.open(File.join(self.class.root, file)).read
  end
  
  private
  def write_buffer_to_file!
    output_file = File.open(self.class.output_file, "w+")
    output_file.puts self.buffer
    output_file.close
  end
end

puts "* Compressing..."

ROOT                   = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Compressor.root        = ROOT
Compressor.output_file = File.join(ROOT, 'build', 'compressed.js')

# Add in filters here

compressor = Compressor.new
# compressor << 'file.js'
compressor.compress!

puts "* Compressed!"
