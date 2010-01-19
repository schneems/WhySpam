require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Whymail do
  
  before(:each) do
    @whymail = Whymail.new
    @website = "thinkbohemian.com"
    @email = "foo@example.com"
    
  end
  
  it "should   " do    
      whymail = Whymail.create_with_user(@email, @website )
      digest1 = Whymail.create_digest(@email, @website, "whyspam.me")
      whymail.email.should_not == digest1 
  end
  
    

  
  it "should create a new and different cryptmail if one already exists with that same cryptmail" do    
      whymail = Whymail.create_with_user(@email, @website )
      digest1 = Whymail.create_digest(@email, @website, "whyspam.me")
      whymail.email.should_not == digest1 
  end
  
   it "create_with_user should not create a whymail the website is an email address" do
   
     assert_difference 'User.count', 1 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user("alskdfjalskdjf@sadf.com", "asdflkasjdflkj@asldfkjasldkfj.com" )
         whymail.errors.full_messages.first.should == "Website cannot be an email address"
       end
     end
   end
  
  
   it "create_with_user should not create a whymail or user if there are problems with the email address" do
     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user("notAvalidEmail", @website )
         whymail.errors.full_messages.first.should == "The email address you provided is invalid"
       end
     end
   end
   
  
   it "create_with_user should not create a user or whymail if one already exists" do
     whymail = Whymail.create_with_user(@email, @website )

     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user(@email, @website )
         whymail.website.should == @website
       end
     end
  #   whymail.website.should == @website
   end
   
  
   it "create_with_user should not create a user if one already exists" do
     whymail = Whymail.create_with_user(@email, @website )

     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 1 do   
         whymail = Whymail.create_with_user(@email, "whyspam.me")
       end
     end
  #   whymail.website.should == @website
   end
   
  
  it "create_with_user should create a user and add a whymail" do
    
    assert_difference 'User.count', 1 do   
      assert_difference 'Whymail.count', 1 do   
        whymail = Whymail.create_with_user(@email, @website )
        whymail.website.should == @website
      end
    end
 #   whymail.website.should == @website
  end
  


  
  
  it "should sanatize an incoming url" do
     site = "http://news.ycombinator.com"
     digest = "asdlfkjasdlkfjaslkdfj"
     @user  = User.create(:email => @email, :login => @email, :password => @email, :password_confirmation => @email)
     
     w =  @user.whymail.create(:website => site, :email => digest.upcase + "@WHYSPAM.ME")
     w.website.should == "news.ycombinator.com"
     
  end
  
  
   it "should create a website if none exists after creation" do
      site = "http://news.ycombinator.com"
      digest = "asdlfkjasdlkfjaslkdfj"
      @user  = User.create(:email => @email, :login => @email, :password => @email, :password_confirmation => @email)
      
      assert_difference 'Website.count', 1 do   
        
        @user.whymail.create(:website => site, :email => digest.upcase + "@WHYSPAM.ME")
      end
   end  
   
   it "should not create a website if one already exists after creation" do
     site = Website.create(:url => "whatever.com", :rank => 0, :grade => "N/A")
     @user  = User.create(:email => @email, :login => @email, :password => @email, :password_confirmation => @email)
     
      assert_difference 'Website.count', 0 do   
        @user.whymail.create(:website => site.url, :email =>"asldkfjalskdfjlasdkjf@WHYSPAM.ME")
      end
   end
   
   it "should sanatize an incoming url when creating a website" do
      site = "http://news.ycombinator.com"
      digest = "asdlfkjasdlkfjaslkdfj"
      @user  = User.create(:email => @email, :login => @email, :password => @email, :password_confirmation => @email)
      
      whymail =  @user.whymail.create(:website => site, :email => digest.upcase + "@WHYSPAM.ME")

      Website.last.url.should == "news.ycombinator.com"
   end
   
   
end
  
  