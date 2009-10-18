require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe FormsController do
  integrate_views
  include Authlogic::TestCase
  
  describe "show /forms/show/id" do
     before(:each) do
       @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :comments => "blah")
      # Forms.stubs(:find_by_crypt).returns(@form)
       Forms.stubs(:find).returns(@form)
     end


    it "delete a form" do
         get 'show', :id => @form.id
         response.should render_template("show")
    end
    
  end
  
  
  describe "destroy /forms/destroy" do
    before(:each) do
      @user = User.create_by_email("foo@example.com")
      @form = Factory.create(:forms, :user => @user) 
    #  @form = mock_model(Forms, :id => "1")
    #  Forms.stubs(:find_by_crypt).and_return(@form)
      Forms.stubs(:find).returns(@form)
    
    end
    
    
   it "delete a form" do
      login_as(@user)
      
      assert_difference 'Forms.count', -1 do   
        delete 'destroy', :id => @form.id
      end
      
   end
   
   it "should  not delete a form if user is not logged in or user is not current form's user" do
     assert_difference 'Forms.count', 0 do   
       delete 'destroy', :id => @form.id
     end
     
      login_as(stub_model(User))
      
      assert_difference 'Forms.count', 0 do   
        delete 'destroy', :id => @form.id
      end
   end
    
  end
  
  
  describe "send_form /forms/show/zq" do
    before(:each) do
    #  @form = Factory.create(:forms)
     # @form = stub('Forms', :)
      @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah")
      Forms.stubs(:find_by_crypt).returns(@form)
      Forms.stubs(:find).returns(@form)
      
    end
    
    
    it "should render show" do
      post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_0@example.com', :comments => 'this is a super cool feature' }
      response.should redirect_to(form_path(@form))
    end
    
    
    it "should create a ticket" do
        assert_difference 'Ticket.count', 1 do   
          post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent@example.com', :comments => 'this is a super cool feature' }
        end
        flash[:notice].should == configatron.form_send_success
    end
    
    it "should give me a session error when i use it too many times" do
        session[:count] = 11
        assert_difference 'Ticket.count', 0 do   
          post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :comments => 'this is a super cool feature' }
        end
       # assigns[:extra_message].should = configatron.session_count_error
        session[:count] = 0
    end
    
    it "should fail if i submit an invalid id" do
        post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :comments => '' }
        flash[:error].should match(/#{configatron.no_message}/)
    end
    
    it "should fail if i submit an invalid id" do
        Forms.stubs(:find).returns(nil)
        post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :comments => 'this is a super cool feature' }
        flash[:error].should match(/#{configatron.invalid_form}/)
    end
    
    
    
    
    
    
  end
  
  
  describe "CREATE /forms/create" do    
    it "should give me a session error when i use it too many times" do
        session[:count] = 11
        post 'create', :form => { :email => 'foo_form@example.com', :comments => 'this is a super cool feature' }
        assigns[:extra_message].should == configatron.session_count_error
        session[:count] = 0
    end
    
    it "should render create" do
      post 'create', :form => { :email => 'foo_form_0@example.com', :comments => 'this is a super cool feature' }
      response.should render_template("_create")
    end
    
    it "should create a user if one does not already exist" do
      assert_difference 'User.count', 1 do   
          post 'create', :form => { :email => 'foo_form@example.com', :comments => 'this is a super cool feature' }
      end
    end
    
    it "should not allow me to create more than one form for given set of email/comments" do
      post 'create', :form => { :email => 'foo_form1@example.com', :comments => 'this is a super cool feature' }
      assert_difference 'User.count', 0 do   
          post 'create', :form => { :email => 'foo_form1@example.com', :comments => 'this is a super cool feature' }
      end
      assigns[:extra_message].should == configatron.duplicate_email_forms
    end
    
    it "should not allow me to create more than one form for given set of email/comments" do
      assert_difference 'Forms.count', 1 do   
          post 'create', :form => { :email => 'foo_form2@example.com', :comments => 'this is a super cool feature' }
      end
      assigns[:address].should == Forms.last.address
    end
  end
  
  

end