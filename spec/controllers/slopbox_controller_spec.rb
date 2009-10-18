require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe SlopboxController do
  integrate_views
  
  describe "SHOW" do
    
    before(:each) do
      @ticket = mock_model(Ticket)
      @ticket.stubs(:first).returns(@ticket)
      @ticket.stubs(:each).returns(@ticket)
      Ticket.stubs(:find).returns(@ticket)  
      request.env["HTTP_REFERER"] = "new"     
    end
    
    
    it "should render the show slop" do
      get :show, :ticket => { :to_email => "boblawblaw@example.com" }
      flash[:notice].should == "You've got mail"
      response.should render_template("show")
    end
    
    it "should render the show slop" do
      get :show, :ticket => { :to_email => "boblawblawaaaaaaaaaa@example.com" }
      flash[:notice].should_not == "You've got mail"
      flash[:error].should match(/This is an address that may be used by a WhySpam Secure Email in the future/)
    end
    
    
  end
  
end