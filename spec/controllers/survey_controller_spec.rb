require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SurveysController do
  integrate_views

  
  describe "GET /spamfire/new" do
    it "should render new" do
      user = Factory.create(:user)
      @whymail = Factory.create(:whymail, :website => "example.com", :user => user)
      
      Whymail.stubs(:find).returns(@whymail)
      
      get :new, :whymail => @whymail.id
      response.should render_template("_new")
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
    
    
    it "should show my freakin comments in a new survey " do
      @whymail.expects(:destroy).returns(true)
      comment = "hello there how are you"
      assert_difference "Survey.count", 1 do      
        post 'create', :whymail => @whymail.id, :survey => {:comments => comment, :opt_out => "true", 
                        :un_solicited => "true", :sell => "true", :vulgar => "true", :give_out => "false", 
                        :email => "blah", :user_id => @user.id }
      end
      Survey.last.comments.should == comment
      
    end
    
    
    
    it "should create a new survey " do
      @whymail.expects(:destroy).returns(true)
      
      assert_difference "Survey.count", 1 do      
        post 'create', :whymail => @whymail.id, :survey => {:opt_out => "true", :un_solicited => "true", :sell => "true", :vulgar => "true", :give_out => "false", :email => "blah", :user_id => @user.id }      
      end  
      
      response.should be_redirect      
      response.should redirect_to(:controller => 'websites', :action => 'show',  :url => @whymail.website)
      
    end
    
    it "should not create a survey if no survey params given" do
      @whymail.expects(:destroy).returns(true)
      assert_difference "Survey.count", 0 do      
        post 'create', :whymail => @whymail.id
      end    
      response.should be_redirect      
      response.should redirect_to(:controller => 'websites', :action => 'show',  :url => @whymail.website)
    end
    
    it "should not create a survey if user is not logged in " do
      login_as(nil)
      @whymail.expects(:destroy).never
      assert_difference "Survey.count", 0 do      
        post 'create', :whymail => @whymail.id
      end
      response.should be_redirect      
      response.should redirect_to(:controller => 'manage', :action => 'index')
      
    end
    

   
  
  end

end