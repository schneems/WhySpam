require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Whymail do
    
    
  describe "test level" do
    before(:each) do
      @whymail = Whymail.new
      @website = "thinkbohemian.com"
      @email = "foo@example.com"    
      @user = Factory.create(:user, :level => "novice")
    end
    
    it "test category shady" do
      whymail = Whymail.create_with_user(@user.email, "website", "@whyspam.me" , :category => "shady")
      whymail.should be_valid
      whymail.save.should be_true
      puts whymail.email.downcase
    end
    
    it "test category shady" do
      puts "========================"
      
      email = @user.email
      whymail = Whymail.create_with_user(email, "website098098", "@whyspam.me" , :category => "shady")
      whymail.should be_valid
      whymail.save.should be_true
      puts "________________________"
      
      whymail2 = Whymail.create_with_user(email, "website098098", "@whyspam.me" , :category => "shady")
      whymail2.email.should == whymail.email
    end
    
  
    it "something" do
      whymail =  Whymail.create_digest("alskjdf@asldfkj.com", "example.com", "@whyspam.me", {:level => "novice", :category => "shady"}) 
      
    end
  end
  
  
  ## testing different @email.com for same website
  
  before(:each) do
    @whymail = Whymail.new
    @website = "thinkbohemian.com"
    @email = "foo@example.com"    
  end
  
  
  it "create_with_user should return the same website if one already exists with this" do    
      whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      whymail2 = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      whymail.should == whymail2
  end
  
  it "create_with_user should allow the same website with a different domain" do    
      whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      whymail2 = Whymail.create_with_user(@email, @website, "@amilegit.com" )
      whymail.email.should_not == whymail2.email
  end
  
  it "should test not duplicate create_digest" do    
      whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      digest1 = Whymail.create_digest(@email, @website, "@whyspam.me")
      whymail.email.should_not == digest1 
  end
  
  it "should test not duplicate create_digest" do    
      whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      digest1 = Whymail.create_digest(@email, @website, "@whyspam.me")
      whymail.email.should_not == digest1 
  end
  
  it "should test not duplicate create_digest" do    
      digest1 = Whymail.create_digest(@email, @website, "@whyspam.me" )
      sleep 1
      digest2 = Whymail.create_digest(@email, @website, "@whyspam.me")
      digest1.should_not == digest2
  end
  
    

  
  it "should create a new and different cryptmail if one already exists with that same cryptmail" do    
      whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
      digest1 = Whymail.create_digest(@email, @website, "whyspam.me")
      whymail.email.should_not == digest1 
  end
  
   it "create_with_user should not create a whymail the website is an email address" do
   
     assert_difference 'User.count', 1 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user("alskdfjalskdjf@sadf.com", "asdflkasjdflkj@asldfkjasldkfj.com", "@whyspam.me" )
         whymail.errors.full_messages.first.should == "Website cannot be an email address"
       end
     end
   end
  
  
   it "create_with_user should not create a whymail or user if there are problems with the email address" do
     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user("notAvalidEmail", @website, "@whyspam.me" )
         whymail.errors.full_messages.first.should == "The email address you provided is invalid"
       end
     end
   end
   
  
   it "create_with_user should not create a user or whymail if one already exists" do
     whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )

     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 0 do   
         whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
         whymail.website.should == @website
       end
     end
  #   whymail.website.should == @website
   end
   
  
   it "create_with_user should not create a user if one already exists" do
     whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )

     assert_difference 'User.count', 0 do   
       assert_difference 'Whymail.count', 1 do   
         whymail = Whymail.create_with_user(@email, "whyspam.me","@whyspam.me" )
       end
     end
  #   whymail.website.should == @website
   end
   
  
  it "create_with_user should create a user and add a whymail" do
    
    assert_difference 'User.count', 1 do   
      assert_difference 'Whymail.count', 1 do   
        whymail = Whymail.create_with_user(@email, @website, "@whyspam.me" )
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
  
  