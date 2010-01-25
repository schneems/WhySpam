require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Website do
  
  describe "populate_website_counts_from_surveys" do
    it "should give me the add up my surveys or set them to zero" do
        @website = Website.create(:url => "testing.com", :grade => "NA" )
        @survey = Factory(:survey, :opt_out => "true")
        @website.stubs(:surveys).returns([@survey])
        @website.populate_website_counts_from_surveys
        @website.opt_out_count.should == 1
        @website.un_solicited_count.should == 0
        @website.sell_count.should == 0
        @website.vulgar_count.should == 0 
    end
      
      it "should give me the add up my surveys or set them to zero" do
          @website = Website.create(:url => "testing.com", :grade => "NA" )
          @survey = Factory(:survey)
          @website.stubs(:surveys).returns([@survey])
          @website.populate_website_counts_from_surveys
          @website.opt_out_count.should == 0
          @website.un_solicited_count.should == 0
          @website.sell_count.should == 0
          @website.vulgar_count.should == 0 
      end
      
      it "should give me the add up my surveys or set them to zero" do
          @website = Website.create(:url => "testing.com", :grade => "NA" )
          @survey = Factory(:survey, :opt_out => "true", :un_solicited => "true", :sell => "true", :vulgar => "true")
          @website.stubs(:surveys).returns([@survey])
          @website.populate_website_counts_from_surveys
          @website.opt_out_count.should == 1
          @website.un_solicited_count.should == 1
          @website.sell_count.should == 1
          @website.vulgar_count.should == 1
      end
      
      
  end
  
  describe "calculate_rank_and_grade" do
  
  
    it "should give me an A+ and a 100 if all fields are 0" do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 0,
            :un_solicited_count => 0,
            :sell_count => 0,
            :vulgar_count => 0 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.rank.should == 100
      @website.grade.should == "A+"
    end
    
    
#    it "should not break if counts are nil" do    
#      @website = Website.create( 
#            :rank => 0,
#            :url => "testing.com",
#            :grade => "N/A" )
#      @website.surveys.stubs(:count).returns(0)
#      @website.calculate_rank_and_grade
#      @website.rank.should == 0
#      @website.grade.should == "N/A"
#    end
    
    
    
    it "should give me an A+ and a 100 if all fields are 0" do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 0,
            :un_solicited_count => 0,
            :sell_count => 0,
            :vulgar_count => 0 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.rank.should == 100
      @website.grade.should == "A+"
    end
    
    it "should give me an A- and a 100 if all fields are 0 but opt_out_count" do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 1,
            :un_solicited_count => 0,
            :sell_count => 0,
            :vulgar_count => 0 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.grade.should == "A-"
    end
    
    it "should give me an B and if all fields are 0 but opt_out_count and un_solicited " do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 1,
            :un_solicited_count => 1,
            :sell_count => 0,
            :vulgar_count => 0 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.grade.should == "B"
    end
    
    it "should give me an C and if all fields are 0 sell_count " do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 0,
            :un_solicited_count => 0,
            :sell_count => 1,
            :vulgar_count => 0 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.grade.should == "C"
    end
    
    
    it "should give me an D and if all fields are 0 vulgar_count " do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 0,
            :un_solicited_count => 0,
            :sell_count => 0,
            :vulgar_count =>  1,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.grade.should == "D"
    end
    
    
    
    
    it "should give me a F and a 35 if all fields are 1 but opt_out" do  
      @website = Website.create( 
            :url => "testing.com",
            :grade => "NA",
            :opt_out_count => 1,
            :un_solicited_count => 1,
            :sell_count => 1,
            :vulgar_count => 1 ,
            :give_out_count =>  0
            )
      @website.surveys.stubs(:count).returns(1)
      @website.calculate_rank_and_grade
      @website.grade.should == "F"
    end
    
    
    
    it "should give me a N/A and a 0 if all fields are true" do    
      @website = Website.create( 
            :url => "testing.com",
            :grade => "N/A",
            :rank => 0,
            :opt_out_count => 1,
            :un_solicited_count => 1,
            :sell_count => 1,
            :vulgar_count => 1 ,
            :give_out_count =>  1
            )
      @website.surveys.stubs(:count).returns(1)      
      @website.grade.should == "N/A"
      @website.rank.should == 0
      
    end
    
  end
  
    

  
   
   
end
  
