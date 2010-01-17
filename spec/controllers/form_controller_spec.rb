require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

 # integrate_views
  
describe FormsController do
  integrate_views
  include Authlogic::TestCase
  
  
  
  describe "CREATE /forms/create" do  
   # it "should take a name and return a name" do
   #   post 'create', :form => { :email => 'foo_form@example.com', :name => "Richie" }
   #   assigns[:name].should  == "Richie"
   #   response.should have_text("Richie")
   # end
      
    it "should give me a session error when i use it too many times" do
        session[:count] = 11
        post 'create', :forms => { :email => 'foo_form@example.com', :name => "Richie" }
        assigns[:extra_message].should == configatron.session_count_error
        session[:count] = 0
    end
    
    it "should render create" do
      post 'create', :forms => { :email => 'foo_form_0@example.com', :name => "Richie" }
      response.should render_template("_create")
      assert_response :success
    end
    
    it "should create a user if one does not already exist" do
      assert_difference 'User.count', 1 do   
          post 'create', :forms => { :email => 'foo_form@example.com', :name => "Richie" }
      end
      assert_response :success
      
    end
    
  #  it "should not allow me to create more than one form for given set of email/comments" do
  #    post 'create', :form => { :email => 'foo_form1@example.com', :name => "Richie" }
  #    assert_difference 'User.count', 0 do   
  #        post 'create', :form => { :email => 'foo_form1@example.com', :comments => 'this is a super cool feature' }
  #    end
  #    assigns[:extra_message].should == configatron.duplicate_email_forms
  #  end
    
    it "should not allow me to create more than one form for given set of email/comments" do
      assert_difference 'Forms.count', 1 do   
          post 'create', :forms => { :email => 'foo_form2@example.com', :name => "Richie" }
      end
      assigns[:address].should == Forms.last.address
      assert_response :success
      
    end
  end
  
  
  describe "show /forms/show/id" do
     before(:each) do
       @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :created_at => Time.now, :name => "Richie")
      # Forms.stubs(:find_by_crypt).returns(@form)
       Forms.stubs(:find).returns(@form)
     end

     it "should show a name" do
       get 'show', :id => @form.id
       
       assigns[:form_data].name.should == "Richie"
      # response.should have_text("Richie")
       
     end

    it "delete a form" do
         get 'show', :id => @form.id
         response.should render_template("show")
         assert_response :success
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
      @form = mock_model(Forms, :id => "1", :email => "what@blah.com", :address => "huzzah", :name => "Richie")
      Forms.stubs(:find_by_crypt).returns(@form)
      Forms.stubs(:find).returns(@form)
      
    end
    
    
    it "should render show" do
      post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_0@example.com', :name => "Richie", :comments => "whazzup" }
      response.should redirect_to("/forms/huzzah")
      assert_response :redirect
    end
    
    
    it "should create a ticket" do
      
        assert_difference 'Ticket.count', 1 do   
          post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sentz@example.com', :name => "Richie", :comments => "hey there"}
        end
        flash[:notice].should == configatron.form_send_success
    end
    
    it "should give me a session error when i use it too many times" do
        session[:count] = 11
        assert_difference 'Ticket.count', 0 do   
          post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :name => "Richie" }
        end
       # assigns[:extra_message].should = configatron.session_count_error
        session[:count] = 0
        assert_response :redirect
    end
    
    it "should fail if i submit no message" do
        post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :name => "" , :comments => "" }
        flash[:error].should match(/#{configatron.no_message}/)
        assert_response :redirect
    end
    
    it "should fail if i submit an invalid id" do
        Forms.stubs(:find).returns(nil)
        post 'send_form', :form => { :form_id => @form.id, :email => 'foo_form_sent_1@example.com', :comments => 'this is a super cool feature' }
        flash[:error].should match(/#{configatron.invalid_form}/)
        assert_response :redirect
    end
    
    
    
    
    
    
  end
  
  
  
  
  

end