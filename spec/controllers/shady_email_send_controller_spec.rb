require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe ShadyemailSendController do
  integrate_views
  
  describe "new /" do
       
       before(:each) do
         @user = Factory.create(:user)
         @whymail = Factory.create(:whymail, :user_id => @user.id )
       end
    
    
      it "should display the new partial" do
        get 'new', :user => {:id => @user.id, :whymail => @whymail.email}
        assigns[:whymail].should == @whymail
        assigns[:user].should == @user
        
        
        response.should render_template("_new") 
      end
      
      
      it "should not generate a valid whymail if user is not provided" do
        get 'new', :user => { :whymail => @whymail.email}
        assigns[:whymail].should == nil
        assigns[:user].should == nil      
        response.should render_template("_new") 
      end
      
      
      it "should not generate a valid whymail if whymail is not provided" do
        get 'new', :user => {:id => @user.id}
        assigns[:whymail].should == nil
        assigns[:user].should == @user    
        response.should render_template("_new")         
      end
      
      
      

   end
   
   describe "new /" do
      before(:each) do
        @user = Factory.create(:user)
        @whymail = Factory.create(:whymail, :user_id => @user.id )
      end
   
   
     it "should display the create partial" do
       # Parameters: {"whymail"=>"COCKMONGLER_SMOOTH516@AWE4.COM", "captcha"=>"Copy Text from Image", "user"=>"66"}
       get 'create', :id => @user.id, :user => { :message => "testing" }, :whymail => @whymail.email 
       assigns[:whymail].should == @whymail
       assigns[:user].should == @user       
       response.should render_template("_create") 
     end
     
     it "should not have a user if no valid id is given " do
       get 'create'
       assigns[:whymail].should == nil
       assigns[:user].should_not be_valid
       response.should render_template("_create") 
     end
     
     
     it "should not have a whymail if no valid whymail is given " do
       get 'create', :id => @user.id
       assigns[:whymail].should == nil
       response.should render_template("_create") 
     end
     
   # "whymail"=>"COCKMONGLER_SMOOTH516@AWE4.COM", 
   # "captcha"=>"Copy Text from Image", 
   # "user_id"=>"66", 
   # "user"=>{"subject"=>"Subject", "to"=>"To Address ", "message"=>"Put your message here, \n\n Note:  This service is to be used for novelty purposes. By sending a fake email or prank email you may be committing the offense of fraud even you did not intend to. You are not allowed to use this service for any illegal activities at any time. \n\nShady Email and WhySpam.Me is not liable for your emails you send at any time. \n\n Good Luck Have Fun"}}
     
     
     
     it "should generate an email " do
       subject = "this is a subject"
       to = "shadyemailtest@example.com"
       assert_difference "getMockEmails.count" , 1 do
         get 'create', :whymail => @whymail.email, :id => @user.id,:user => { :subject => subject, :to => to, :message => "world"}
       end
       mail = TMail::Mail.parse(getMockEmails.last)
       mail.subject.should == subject
       mail.to.first.should == to
       response.should render_template("_create") 
     end
     
     
 #    it "fail" do 
 #      false.should == true
 #    end
     
   
   end
   
end