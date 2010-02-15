require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TicketsController do
  integrate_views
  
  describe "show /signup" do
    
    before(:each) do
      @user = Factory.create(:user)
      @whymail = Factory.create(:whymail, :user_id => @user.id )
      @ticket = Factory.create(:ticket, :whymail_id => @whymail.id )
    end
    
    it "should allow for us to delete tickets" do 

      post :destroy, :id => @ticket.id
      assert_response :redirect
      
      
    end
    
    
  # slopbox was removed from this app 
  #  it "should show slop if no whymail or forms" do
  #    @ticket.whymail = nil
  #    @ticket.forms = nil
  #    request.env["HTTP_REFERER"] = "new"     
  #
  #
  #    get :show, :id => @ticket.id      
  #    assigns[:user].should be_nil
  #    response.should render_template("_show")
  #  end
    
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