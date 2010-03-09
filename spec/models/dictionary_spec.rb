require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Dictionary do
  
  
  describe "random" do
    it "random should not give me nil" do    
      d1 = Dictionary.random
      d1.category.should == "generic"
      d1.should_not be_nil    
    end
  
    it "random should provide random dictionary entries" do    
      d1 = Dictionary.random
      d2 = Dictionary.random
      d1.should_not == d2
    end
    
    it "random let me pick from a specific category" do   
      category = "generic" 
      d1 = Dictionary.random(:category => category)
      d1.category.should == category
    end
    
    it "random let me pick from a specific length" do   
      length = 4
      d1 = Dictionary.random(:length => length)
      d1.length.should < length
    end
    
  end
  
  it "create address should create new different addresses" do 
    d1 = Dictionary.create_address("@whyspam.me")
    d2 = Dictionary.create_address("@whyspam.me")
    d1.should_not == d2
  end
  
  
  

end