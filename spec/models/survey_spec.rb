require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Survey do 
  
  describe "after_save -> add_up_surveys" do
    it "calculate the propper values for surveys" do
      user = Factory.create(:user)
      website = Factory.create(:website)
      survey = website.surveys.create( :opt_out => "true", 
                              :un_solicited => "true",
                              :sell => "true", 
                              :vulgar => "true",
                              :give_out => "false", 
                              :email => "1234431234@WHYSPAM.ME")
      
   #   survey.errors.each{|attr,msg| puts "#{attr} - #{msg}\n" }
      
      website = Website.find(website.id)  
      website.surveys.count.should == 1
      website.opt_out_count.should == 1
      website.un_solicited_count.should == 1
      website.sell_count.should == 1
      website.vulgar_count.should == 1
    end
    
    
    
     it "should not save surveys if you give out the email" do
       survey = Survey.create( :opt_out => "true", 
                               :un_solicited => "true",
                               :sell => "true", 
                               :vulgar => "true",
                               :give_out => "true", 
                               :email => "1234431234@WHYSPAM.ME")

    #   survey.errors.each{|attr,msg| puts "#{attr} - #{msg}\n" }
        survey.should_not be_valid
     end
     
     
     
     it "calculate the propper values for surveys" do
       user = Factory.create(:user)
       website = Factory.create(:website)
       survey = website.surveys.create( :opt_out => "false", 
                               :un_solicited => "false",
                               :sell => "false", 
                               :vulgar => "false",
                               :give_out => "false", 
                               :email => "1234431234@WHYSPAM.ME")

    #   survey.errors.each{|attr,msg| puts "#{attr} - #{msg}\n" }

       website = Website.find(website.id)  
       website.surveys.count.should == 1
       website.opt_out_count.should == 0
       website.un_solicited_count.should == 0
       website.sell_count.should == 0
       website.vulgar_count.should == 0
     end
     
  end
end