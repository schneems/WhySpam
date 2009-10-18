require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe ManageController do
  integrate_views
  
  
  describe "index /manage" do
    it "should render index" do
      @user = mock_model(User, :email => "foo@example.com")
    #  @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :comments => "blah")
    #  @whymail = mock_model(Whymail, :id => "2", :created_at => Time.now, :email => "asdf"  )
    #  @ticket_whymail = mock_model(Ticket, :from_email => "from@example.com", :to_email => "to@example.com", :subject => "none", :body => "none")
    #  @ticket_form = mock_model(Ticket, :from_email => "blah@example.com", :to_email => "heyto@example.com", :subject => "none", :body => "none")
      @user.stubs(:whymail).returns(nil)
      @user.stubs(:forms).returns(nil)
      @user.stubs(:admin?).returns(false)
      User.stubs(:find).returns(@user)
      login_as(@user)
      get 'index'            
      response.should render_template("index")
    end
    
    it "should render index" do
      login_as(nil)
      get 'index'            
      response.should redirect_to(login_path)
      flash[:error].should == configatron.please_login
    end
    
  
  end
  
  describe "show /manage" do
     before(:each) do
       @ticket = mock_model(Ticket, :from_email => "from@example.com", :to_email => "to@example.com", :subject => "none", :body => "none")
       @ticket.stubs(:each).returns(@ticket)
       @user = mock_model(User, :email => "foo@example.com")
       @user.stubs(:admin?).returns(false)       
   #    @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :comments => "blah")
   #    @form.stubs(:user).returns(@user)
       request.env["HTTP_REFERER"] = "new"       
     end
     
     
     it "should render a show with whymail" do
       Whymail.stubs(:find).returns(@whymail)
          login_as(@user)
          @whymail = mock_model(Whymail, :id => "2", :created_at => Time.now, :email => "asdf"  )
          Whymail.stubs(:find).returns(@whymail)
          @whymail.stubs(:tickets).returns(@ticket)
          @whymail.stubs(:user).returns(@user)
          get 'show', :id => @whymail.id, :type => "whymail" ## "forms"              
          response.should render_template("show")
     end
     
     
     it "should render a show" do
          login_as(@user)
          @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :comments => "blah")
          Forms.stubs(:find).returns(@form)
          @form.stubs(:tickets).returns(@ticket)
          @form.stubs(:user).returns(@user)
          get 'show', :id => @form.id, :type => "form" ## "forms"              
          response.should render_template("show")
     end
     
     it "should give us an error if current user != @user" do
          login_as(mock_model(User))
          @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :comments => "blah")
          Forms.stubs(:find).returns(@form)
          @form.stubs(:tickets).returns(@ticket)
          @form.stubs(:user).returns(@user)
          get 'show', :id => @form.id, :type => "form" ## "forms"              
          flash[:error].should == configatron.bad_permissions
          assigns[:whymail].should be_nil
          assigns[:tickets].should be_nil
     end
     
     
   end
  
  
  
end