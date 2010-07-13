describe Processr do
  
  before :each do
    Processr.configure do |config|
      config.root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    end
    
    @processor = Processr.new
  end
  
  it "should successfully accept a configuration block" do
    root = nil
    out  = nil
    
    Processr.configure do |config|
      config.root = root
      config.out  = out
    end
    
    Processr.root.should be_nil
    Processr.out.should be_nil
    
    root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    out  = File.join(root, '..', 'examples', 'all')
    
    Processr.configure do |config|
      config.root = root
      config.out  = out
    end
    
    Processr.root.should == root
    Processr.out.should  == out
  end
  
  it "should allow text to be added to the buffer" do
    @processor.buffer.should == ""
    @processor << "Some Text"
    @processor.buffer.should == "Some Text"
  end
  
  it "should read files to the buffer if no output file is provided" do
    Processr.out = nil
    @processor.buffer.should == ""
    @processor.files << File.join('fixtures', 'one.txt')
    @processor.files << File.join('fixtures', 'two.txt')
    @processor.process!.should == "one\ntwo\n"
  end
  
  it "should write files from the buffer if an output file is given" do
    Processr.out = File.join(Processr.root, 'fixtures', 'output.txt')
    
    @processor.buffer.should == ""
    @processor.files << File.join('fixtures', 'one.txt')
    @processor.process!.should be_true
    
    File.exists?(File.join(Processr.root, 'fixtures', 'output.txt')).should == true
    File.open(File.join(Processr.root, 'fixtures', 'output.txt')).read.should == "one\n"
  end
  
  it "should allow the use of filters to modify output" do
    Processr.out = nil
    
    LanguageFilter = lambda do |buffer|
      lookup = [
        "fucking",
        "hate"
      ]
      
      lookup.each do |word|
        buffer.gsub!(word, ("*" * word.size))
      end
      
      buffer
    end
    
    @processor.add_filter(LanguageFilter)
    @processor << "I fucking hate bad language."
    @processor.process!.should == "I ******* **** bad language."
  end
  
end
