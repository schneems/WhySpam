require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SurveysController do
  integrate_views

  
  describe "Net /spamfire/new" do
    it "should render new" do
      user = Factory.create(:user)
      @whymail = Factory.create(:whymail, :website => "example.com", :user => user)
      
      Whymail.stubs(:find).returns(@whymail)
      
      get :new, :whymail => @whymail.id
      response.should render_template("new")
      assigns[:survey].should_not == nil
      
    end
    
    it "add to an existing survey" do
   #   user = Factory.create(:user)
   #   @whymail = Factory.create(:whymail, :website => "example.com", :user => user)
   #   
   #   Whymail.stubs(:find).returns(@whymail)
   #   
   #   get :new, :whymail => @whymail.id
   #   response.should render_template("new")
   #   
   #   assigns[:survey].should_not == nil
   #   flash[:error].should_not == configatron.bad_website
   #   
    end

    
  end
  
  describe "CREATE /survey" do
    before(:each) do
      @user = mock_model(User, :id => "99", :email => "myemail@blah.com")
      @whymail = mock_model(Whymail, :id => "1", :email => "what@blah.com", :email => "huzzah", :user => @user, :website => "sketchy.com")
      Whymail.stubs(:find).returns(@whymail)
      login_as(@user)
      
    end
    
    it "should create a new survey " do
      @whymail.expects(:destroy).returns(true)
      
      assert_difference "Survey.count", 1 do      
        post 'create', :whymail => @whymail.id, :survey => {:opt_out => "true", :un_solicited => "true", :sell => "true", :vulgar => "true", :give_out => "true", :email => "blah"}      
      end
    end
    
    it "should not create a survey if no survey params given" do
      @whymail.expects(:destroy).returns(true)
      
      assert_difference "Survey.count", 0 do      
        post 'create', :whymail => @whymail.id
      end
    end
    
    it "should not create a survey if no survey params given" do
      login_as(nil)
      @whymail.expects(:destroy).never
      assert_difference "Survey.count", 0 do      
        post 'create', :whymail => @whymail.id
      end
    end
    
    
    
 #   it "should give me a session error" do
 #       session[:count] = 11
 #       post 'create', :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #       assigns[:extra_message].should == configatron.session_count_error_small
 #       session[:count] = 0 
 #   end 
 #        
 #   it "should create a user if no user exists with that email" do
 #       usercount = User.count
 #       post 'create', :user => { :email => 'foo_spamfire_0@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #       User.count.should ==  usercount + 1
 #   end
 #  
 #   it "should get the same email with the same email" do
 #     post 'create', :user => { :email => 'foo_spamfire_1@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #       secure_email = assigns[:secure_email]
 #       post 'create', :user => { :email => 'foo_spamfire_1@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #       assigns[:secure_email].should == secure_email
 # end 
 #  
 #  it "should not allow you to create a secure email with a bad email" do
 #    post 'create', :user => { :email => '@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #      assigns[:extra_message].should == configatron.bad_email_small
 #      post 'create', :user => { :email => '', :website => 'sketchy.com' }, :save => {:checked => '0'}
 #      assigns[:extra_message].should == configatron.bad_email_small
 #  end
 #
 #  it "should save my email address if i check yes" do
 #    email = 'spamfire_cookie_test@example.com'
 #    post 'create', :user => { :email => email, :website => 'sketchy.com' }, :save => {:checked => '1'}
 #    cookies[:email].should == email 
 #    cookies[:checked].should == "true"
 #  end
 #  
 #  it "should save my email address if i check yes" do
 #    email = 'spamfire_cookie_test@example.com'
 #    post 'create', :user => { :email => email, :website => 'sketchy.com' }, :save => {:checked => '1'}
 #    cookies[:email].should == email 
 #    cookies[:checked].should == "true"
 #    post 'create', :user => { :email => email, :website => 'sketchy.com' }, :save => {:checked => '0'}     
 #    cookies[:email].should == nil 
 #    cookies[:checked].should == "false"
 #  end
   
  
  end

end