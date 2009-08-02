require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :users
  
  
    
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  
  
  ## blank email
  ## bad email
  
  def test_no_spam
       email = "richardsAwesome@example.com"
       website = "www.whyspam.me"

       ## good entry
       assert_difference('User.count') do
         post :no_spam, :user => {:email => email, :website => website}
       end
       assert_response :success
       assert_not_nil assigns(:no_spam)
       assert_nil assigns(:extra_message)
       
       ## duplicate entry
       assert_no_difference('User.count') do
         post :no_spam, :user => {:email => email, :website => website}
       end
       assert_response :success
       assert_not_nil assigns(:no_spam)
       assert_not_nil assigns(:extra_message)
       
       # bad entry
       assert_no_difference('User.count') do
         post :no_spam, :user => {:email => " ", :website => website}
       end
       assert_response :success
       assert_nil assigns(:no_spam)
       assert_not_nil assigns(:extra_message)
       
       
     #  post :no_spam, :user => {:email => email, :website => website}
       
      # assert_not_nil assigns(:extra_message)
       
  end
  

  def test_should_allow_signup
    assert_difference 'User.count' do
      create_user
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end
  

  

  protected
    def create_user(options = {})
      post :create, :user => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
