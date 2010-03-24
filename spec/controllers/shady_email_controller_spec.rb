require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe ShadyemailController do
  integrate_views
  
  describe "index /" do
      it "should display the index" do
        get 'index'
        response.should render_template("index") 
      end
   end
   
   
   
   describe "create /" do
  
       it "should render create" do
         atAddress = "@blabetyblahblah.com"
         post 'create', :addrs => atAddress, :user => { :email => 'foo_email_0@example.com', :website => 'sketchy.com' }
         assigns[:whymail].email.should =~ /@blabetyblahblah.com/i
         response.should render_template("_create")
       end
   
       it "should give me a session error" do
           session[:count] = 51
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
    describe "update /" do
    
     # email = params[:user][:whymail]
     # id = params[:user][:id].to_i
     # atAddress = params[:addrs]
      
      before(:each) do
        @user = Factory.create(:user)
        @whymail = Factory.create(:whymail, :user_id => @user.id)
      end
      
     it "should generate a new whymail" do
       email = @whymail.email
       post 'update', :user => { :whymail => email , :website => @whymail.website, :id => @user.id }, :addrs => "@awe4.com"
       response.should render_template("_create")
       assigns[:whymail].should_not be_nil
       assigns[:whymail].email.should_not == email
     end
     
     
     it "should not generate a new whymail if someone forges the site" do
       email = @whymail.email
       second_whymail = Factory.create(:whymail)
       post 'update', :user => { :whymail => second_whymail.email , :website => @whymail.website, :id => @user.id }, :addrs => "@awe4.com"
       response.should render_template("_create")
       assigns[:whymail].should be_nil
     end
     
   end
end