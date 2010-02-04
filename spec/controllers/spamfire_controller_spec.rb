require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')




  
describe SpamfireController do
  integrate_views
  

   
  
  describe "Net /spamfire/new" do
     it "should render new" do
       get :new
       response.should render_template("new")
     end
   end

   describe "CREATE /spamfire" do
     it "should render create" do
       post 'create', :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
       response.should render_template("_create")
     end

     it "should give me a session error" do
         session[:count] = 11
         post 'create', :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
         assigns[:extra_message].should == configatron.session_count_error_small
         session[:count] = 0 
     end 

     it "should create a user if no user exists with that email" do
         usercount = User.count
         post 'create', :user => { :email => 'foo_spamfire_0@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
         User.count.should ==  usercount + 1
     end

     it "should get the same email with the same email" do
       post 'create', :user => { :email => 'foo_spamfire_1@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
         secure_email = assigns[:secure_email]
         post 'create', :user => { :email => 'foo_spamfire_1@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
         assigns[:secure_email].should == secure_email
   end 

    it "should not allow you to create a disposable email with a bad email" do
        post 'create', :user => { :email => '@example.com', :website => 'sketchy.com' }, :save => {:checked => '0'}
        assigns[:extra_message].should == configatron.bad_email_small
        post 'create', :user => { :email => '', :website => 'sketchy.com' }, :save => {:checked => '0'}
        assigns[:extra_message].should == configatron.bad_email_small
    end

   end
   
   
  describe "new /spamfire/new" do
    it "should show the form with no website or email defaults" do
      get 'new'
      assigns[:user].email.should == "Your Email"
      assigns[:user].website.should == "Example.com"
    end    
  
  
      it "should show the form with specified website" do
        post 'new', :website => 'foo.com'
        assigns[:user].website.should == "foo.com"
      end      
    end
    
    
    describe "new /spamfire/create" do
      
      it "should remember my email if i am signed in " do
        @user = Factory(:user)
        login_as(@user)
        post 'new', :website => "example.com"
        assigns[:user].email.should == @user.email     
        assigns[:user].website.should == "example.com"   
      end
      
    end
    
end