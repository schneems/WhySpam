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
    end
  end
  
  
  
  describe "GET /show" do
    it "should render websites EVEN IF it doesn't find the website" do
      Website.expects(:find).at_least(1).returns(nil)
      get :show      
      response.should render_template("show")
      assigns[:website].should be_nil
    end
    
    
    it "should render websites when there are valid surveys" do
      @website = Factory(:website)
      @survey = Factory(:survey, :website_id => @website.id)
      get :show , :url => @website.url
      response.should render_template("show")      
      assigns[:website].should_not be_nil
      assigns[:website].surveys.count.should == 1
      response.should render_template("show")
    end
  end
  
  
end