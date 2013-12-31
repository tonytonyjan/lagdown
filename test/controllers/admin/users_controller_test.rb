require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @admin_user = admin_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_user" do
    assert_difference('Admin::User.count') do
      post :create, admin_user: { email: @admin_user.email, password: @admin_user.password }
    end

    assert_redirected_to admin_user_path(assigns(:admin_user))
  end

  test "should show admin_user" do
    get :show, id: @admin_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_user
    assert_response :success
  end

  test "should update admin_user" do
    patch :update, id: @admin_user, admin_user: { email: @admin_user.email, password: @admin_user.password }
    assert_redirected_to admin_user_path(assigns(:admin_user))
  end

  test "should destroy admin_user" do
    assert_difference('Admin::User.count', -1) do
      delete :destroy, id: @admin_user
    end

    assert_redirected_to admin_users_path
  end
end
