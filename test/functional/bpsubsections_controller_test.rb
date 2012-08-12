require 'test_helper'

class BpsubsectionsControllerTest < ActionController::TestCase
  setup do
    @bpsubsection = bpsubsections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bpsubsections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bpsubsection" do
    assert_difference('Bpsubsection.count') do
      post :create, :bpsubsection => @bpsubsection.attributes
    end

    assert_redirected_to bpsubsection_path(assigns(:bpsubsection))
  end

  test "should show bpsubsection" do
    get :show, :id => @bpsubsection.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bpsubsection.to_param
    assert_response :success
  end

  test "should update bpsubsection" do
    put :update, :id => @bpsubsection.to_param, :bpsubsection => @bpsubsection.attributes
    assert_redirected_to bpsubsection_path(assigns(:bpsubsection))
  end

  test "should destroy bpsubsection" do
    assert_difference('Bpsubsection.count', -1) do
      delete :destroy, :id => @bpsubsection.to_param
    end

    assert_redirected_to bpsubsections_path
  end
end
