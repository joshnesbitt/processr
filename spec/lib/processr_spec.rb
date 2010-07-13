describe Processr do
  
  before :all do
    Processr.configure do |config|
      config.root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
      config.out  = File.join(config.root, 'examples', 'all')
    end
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
    out  = File.join(root, 'examples', 'all')
    
    Processr.configure do |config|
      config.root = root
      config.out  = out
    end
    
    Processr.root.should == root
    Processr.out.should  == out
  end
  
end
