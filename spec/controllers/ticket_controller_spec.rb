require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TicketsController do
  integrate_views
  
  describe "show /signup" do
    
    before(:each) do
      @ticket = mock_model(Ticket, :id => 1, :whymail => true , :from_email => "foo@example.com", :to_email => "too@example.com", :subject => "subject", :body => "body", :created_at => Time.now)
      Ticket.expects(:find).returns(@ticket)
      @user = mock_model(User)
    end
    
    it "should show slop if no whymail or forms" do
      @ticket.stubs(:whymail).returns(nil)
      @ticket.stubs(:forms).returns(nil)
      
      get :show, :id => @ticket.id
      assigns[:user].should be_nil
      response.should render_template("_show")
    end
    
    it "should show whymail if not slop and current_user is user" do
      @ticket.stubs(:whymail).returns(true)
      @ticket.stubs(:forms).returns(true).stubs(:user).returns(@user)      
      @ticket.whymail.stubs(:user).returns(@user)
      login_as(@user)
      get :show, :id => @ticket.id
      assigns[:user].should_not  be_nil
      response.should render_template("_show")
    end
    
    it "should not show whymail if not slop and current_user is not user" do
      @ticket.stubs(:whymail).returns(true)
      @ticket.stubs(:forms).returns(true).stubs(:user).returns(@user)      
      @ticket.whymail.stubs(:user).returns(@user)
      login_as(mock_model(User))
      request.env["HTTP_REFERER"] = "new"     
      get :show, :id => @ticket.id
      assigns[:user].should_not be_nil
      response.should_not render_template("_show")
    end
    
  end
  
end