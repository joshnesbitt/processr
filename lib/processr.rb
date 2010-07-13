$:.unshift File.dirname(__FILE__)

class Processr
  class << self
    def root=(path); @root = path; end
    def root; @root; end
    
    def out=(path); @out = path; end
    def out; @out; end
    
    def configure(&block)
      yield self
    end
  end
  
  attr_accessor :buffer, :filters
  
  def initialize
    self.buffer  = ""
    self.filters = []
  end
  
  def add_filter(filter)
    self.filters << filter
  end
  
  def process!
    self.filters.each do |filter|
      self.buffer = filter.call(self.buffer)
    end
    
    write_buffer!
    
    true
  end
  
  def <<(file)
    self.buffer << File.open(File.join(self.class.root, file)).read
  end
  
  private
  def write_buffer!
    output_file = File.open(self.class.out, "w+")
    output_file.puts self.buffer
    output_file.close
  end
end
