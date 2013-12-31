require 'test_helper'

class Admin::AdministratorsControllerTest < ActionController::TestCase
  setup do
    @admin_administrator = admin_administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_administrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_administrator" do
    assert_difference('Admin::Administrator.count') do
      post :create, admin_administrator: { email: @admin_administrator.email, password: @admin_administrator.password }
    end

    assert_redirected_to admin_administrator_path(assigns(:admin_administrator))
  end

  test "should show admin_administrator" do
    get :show, id: @admin_administrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_administrator
    assert_response :success
  end

  test "should update admin_administrator" do
    patch :update, id: @admin_administrator, admin_administrator: { email: @admin_administrator.email, password: @admin_administrator.password }
    assert_redirected_to admin_administrator_path(assigns(:admin_administrator))
  end

  test "should destroy admin_administrator" do
    assert_difference('Admin::Administrator.count', -1) do
      delete :destroy, id: @admin_administrator
    end

    assert_redirected_to admin_administrators_path
  end
end
