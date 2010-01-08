require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')
  include Cleanurl

describe "cleanurl" do 
  describe "clean_url" do
    it "should sanatize any URLs into a standard with no http://" do
       url =  clean_url("http://blah.com")
       url.should == "blah.com"
    end
    
    it "should sanatize any URLs into a standard with no http://www." do
       url =  clean_url("http://www.blah.com")
       url.should == "blah.com"
    end
    
    it "should sanatize any URLs into a standard with no http://www." do
       url =  clean_url("www.blah.com")
       url.should == "blah.com"
    end
    
    it "should sanatize any URLs into a standard with no http://www." do
       url =  clean_url("http://www.me.blah.com")
       url.should == "me.blah.com"
    end
    
    
  end
  
end