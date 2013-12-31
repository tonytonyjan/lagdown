require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  setup do
    @admin_post = admin_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_post" do
    assert_difference('Admin::Post.count') do
      post :create, admin_post: { content: @admin_post.content, title: @admin_post.title, user_id: @admin_post.user_id }
    end

    assert_redirected_to admin_post_path(assigns(:admin_post))
  end

  test "should show admin_post" do
    get :show, id: @admin_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_post
    assert_response :success
  end

  test "should update admin_post" do
    patch :update, id: @admin_post, admin_post: { content: @admin_post.content, title: @admin_post.title, user_id: @admin_post.user_id }
    assert_redirected_to admin_post_path(assigns(:admin_post))
  end

  test "should destroy admin_post" do
    assert_difference('Admin::Post.count', -1) do
      delete :destroy, id: @admin_post
    end

    assert_redirected_to admin_posts_path
  end
end
