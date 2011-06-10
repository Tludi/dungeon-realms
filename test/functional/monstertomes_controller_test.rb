require 'test_helper'

class MonstertomesControllerTest < ActionController::TestCase
  setup do
    @monstertome = monstertomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monstertomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monstertome" do
    assert_difference('Monstertome.count') do
      post :create, :monstertome => @monstertome.attributes
    end

    assert_redirected_to monstertome_path(assigns(:monstertome))
  end

  test "should show monstertome" do
    get :show, :id => @monstertome.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @monstertome.to_param
    assert_response :success
  end

  test "should update monstertome" do
    put :update, :id => @monstertome.to_param, :monstertome => @monstertome.attributes
    assert_redirected_to monstertome_path(assigns(:monstertome))
  end

  test "should destroy monstertome" do
    assert_difference('Monstertome.count', -1) do
      delete :destroy, :id => @monstertome.to_param
    end

    assert_redirected_to monstertomes_path
  end
end
