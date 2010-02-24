require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe WhymailController do
  integrate_views
  
  describe "DESTROY /" do
     it "should destroy a disposable email when user is also current user" do
       @user = mock_model(User)
       @whymail = mock_model(Whymail)
       @whymail.expects(:user).returns(@user)
       @whymail.expects(:destroy).returns(true)
       Whymail.expects(:find).returns(@whymail)
       request.env["HTTP_REFERER"] = "new"     
       login_as(@user)
      delete 'destroy', :id => @whymail.id
     end
  end
  
  describe "DESTROY /" do
     it "should not allow a different user to delete a disposable email" do
       @whymail = mock_model(Whymail)
       @whymail.expects(:user).returns(nil)
       @whymail.expects(:destroy).never
       Whymail.expects(:find).returns(@whymail)
       login_as(mock_model(User))
       request.env["HTTP_REFERER"] = "new"     
       
      delete 'destroy', :id => @whymail.id
     end
  end
  
  describe "INDEX /" do
     it "should give me a session error" do
       get 'index'
       response.should render_template("index") 
     end
  end
  
  
  describe "CREATE /secure_email" do
    
    
    it "should render create" do
      atAddress = "@blabetyblahblah.com"
      post 'create', :addrs => atAddress, :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }
      assigns[:whymail].email.should =~ /@blabetyblahblah.com/i
      response.should render_template("_create")
    end
    
    it "should give me a session error" do
        session[:count] = 11
        post 'create', :user => { :email => 'foo_email@example.com', :website => 'sketchy.com' }
        assigns[:extra_message].should == configatron.session_count_error
        session[:count] = 0
    end
    
    
    
    it "should render create" do
      post 'create', :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }
      response.should render_template("_create")
    end
    

  
    
    it "should create a user if no user exists with that email" do
      assert_difference 'User.count', 1 do   
        post 'create', :user => { :email => 'foo_email1@example.com', :website => 'sketchy.com' }        
      end
    end
    
    it "should get the same email with the same email" do
        post 'create', :user => { :email => 'foo_email2@example.com', :website => 'sketchy.com' }        
        whymail = assigns[:whymail]
        
        post 'create', :user => { :email => 'foo_email2@example.com', :website => 'sketchy.com' } 
        assigns[:whymail].should == whymail       
    end 
    
    
    it "should not allow you to create a disposable email with a bad email" do
        post 'create', :user => { :email => 'foo_email', :website => 'sketchy.com' }        
        assigns[:whymail].errors.should_not == nil    
    end
    
    
    it "should not allow you to create a disposable email with a bad email" do
        post 'create', :user => { :email => '', :website => 'sketchy.com' }    
        assigns[:whymail].errors.should_not == nil    
#        assigns[:extra_message].should == configatron.bad_email
    end
    
    
  end
  
 # describe "POST /registration" do
 #   before(:each) do
 #     @user = stub_model(User, :admin= => true)
 #     User.stubs(:new).returns(@user)
 #     @user.stubs(:save).returns(true)
 #   end
 #   
 #   it "should re-render new user form when user is not saved" do
 #     @user.stubs(:save).returns(false)
 #     post :create
 #     response.should render_template("new")
 #   end
 #   
 #end
  
end