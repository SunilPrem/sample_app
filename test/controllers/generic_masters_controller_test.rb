require 'test_helper'

class GenericMastersControllerTest < ActionController::TestCase
  setup do
    @generic_master = generic_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generic_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generic_master" do
    assert_difference('GenericMaster.count') do
      post :create, generic_master: { full_name: @generic_master.full_name, name: @generic_master.name, precedence: @generic_master.precedence, type: @generic_master.type }
    end

    assert_redirected_to generic_master_path(assigns(:generic_master))
  end

  test "should show generic_master" do
    get :show, id: @generic_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generic_master
    assert_response :success
  end

  test "should update generic_master" do
    patch :update, id: @generic_master, generic_master: { full_name: @generic_master.full_name, name: @generic_master.name, precedence: @generic_master.precedence, type: @generic_master.type }
    assert_redirected_to generic_master_path(assigns(:generic_master))
  end

  test "should destroy generic_master" do
    assert_difference('GenericMaster.count', -1) do
      delete :destroy, id: @generic_master
    end

    assert_redirected_to generic_masters_path
  end
end
