require 'test_helper'

class BpsectionsControllerTest < ActionController::TestCase
  setup do
    @bpsection = bpsections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bpsections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bpsection" do
    assert_difference('Bpsection.count') do
      post :create, :bpsection => @bpsection.attributes
    end

    assert_redirected_to bpsection_path(assigns(:bpsection))
  end

  test "should show bpsection" do
    get :show, :id => @bpsection.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bpsection.to_param
    assert_response :success
  end

  test "should update bpsection" do
    put :update, :id => @bpsection.to_param, :bpsection => @bpsection.attributes
    assert_redirected_to bpsection_path(assigns(:bpsection))
  end

  test "should destroy bpsection" do
    assert_difference('Bpsection.count', -1) do
      delete :destroy, :id => @bpsection.to_param
    end

    assert_redirected_to bpsections_path
  end
end
