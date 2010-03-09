require 'test_helper'

class DictionariesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dictionaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dictionary" do
    assert_difference('Dictionary.count') do
      post :create, :dictionary => { }
    end

    assert_redirected_to dictionary_path(assigns(:dictionary))
  end

  test "should show dictionary" do
    get :show, :id => dictionaries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dictionaries(:one).to_param
    assert_response :success
  end

  test "should update dictionary" do
    put :update, :id => dictionaries(:one).to_param, :dictionary => { }
    assert_redirected_to dictionary_path(assigns(:dictionary))
  end

  test "should destroy dictionary" do
    assert_difference('Dictionary.count', -1) do
      delete :destroy, :id => dictionaries(:one).to_param
    end

    assert_redirected_to dictionaries_path
  end
end
