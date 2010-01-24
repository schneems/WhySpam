require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsitesController do
  integrate_views
  

  
  
  describe "GET /index" do
    it "should render websites" do
      @website = mock_model(Website, :url => "blah.com", :opt_out_count => 0, :un_solicited_count => 0, :sell_count => 0, :vulgar_count => 0, :give_out_count => 0)
      @website.stubs(:each).returns(@website)
      @website.stubs(:url).returns("blah.com")
      Website.expects(:find).returns(@website)
      get :index      
      assigns[:websites].should == @website
      response.should render_template("index")
      # response.should be_success
      # response.should be_redirect
      
      
    end
  end
  
  describe "GET /show" do
    it "should render websites if doesn't find the website" do
      Website.expects(:find).at_least(1).returns(nil)
      get :show      
      response.should render_template("show")
      assigns[:opt_out_count].should be_nil
    end
    
    
    it "should render websites" do
      @website = mock_model(Website, :grade => "A", :rank => 100, :url => "blah.com", :opt_out_count => 0, :un_solicited_count => 0, :sell_count => 0, :vulgar_count => 0, :give_out_count => 0, :created_at => Time.now)
      @survey = mock_model(Survey, :comments => "it's bad", :created_at => Time.now, :empty? => false, :count => 1)
      @website.stubs(:surveys).returns(@survey)
      @survey.stubs(:each).returns(@survey)
      Website.expects(:find).at_least(1).returns(@website)
      get :show      
      response.should render_template("show")
      assigns[:opt_out_count].should_not be_nil
      assigns[:surveys_count].should == 1
    end
    
  end
  
  
end