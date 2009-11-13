require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe SpamfireController do
  integrate_views
  describe "new /spamfire/new" do
    it "should show the form with no website or email defaults" do
      get 'new'
      assigns[:user].email.should == "Your Email"
      assigns[:user].website.should == "Example.com"
      
    end
    
    it "should show my cookied email if i have one" do
      cookies[:email] = "newemail@example.com"
      post 'new', :website => 'foo.com'
      assigns[:user].email.should == "newemail@example.com"
      assigns[:user].website.should == "foo.com"
    end
    
    
    
      it "should show the form with specified email and website" do
        post 'new', :email => "watchawant@blah.com", :website => 'foo.com'
        assigns[:user].email.should == "watchawant@blah.com"
        assigns[:user].website.should == "foo.com"
      end
      
      

    end
    
    
    describe "new /spamfire/create" do
      it "should save my email if i use cookies" do
        post 'create', :user => {:website => "example.com", :email => "whateveriwant@example.com"}, :save => {:checked => "1"}
        cookies[:email].should == "whateveriwant@example.com"
        cookies[:checked].should == "true"
        post 'new'
        assigns[:user].email.should == "whateveriwant@example.com"
      end
      
      
      it "should save my email if i use cookies" do
        post 'create', :user => {:website => "example.com", :email => "whateveriwant@example.com"}, :save => {:checked => "0"}
        cookies[:email].should_not == "whateveriwant@example.com"
        cookies[:checked].should_not == "true"
        post 'new'
        assigns[:user].email.should_not == "whateveriwant@example.com"
      end
      
    end
    
end