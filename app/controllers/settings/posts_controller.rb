class Settings::PostsController < ApplicationController
  include SettingsConcern
  before_action :set_blog
  before_action :set_post, only: %i[show edit update destroy]
  authorize_resource

  def index
    @posts = @blog.posts.page(params[:page])
  end

  def show
  end

  def new
    @post = @blog.posts.new
  end

  def create
    @post = @blog.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post, subdomain: @blog.subdomain), notice: t('crud.created_successfully!', name: Post.model_name.human)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_url(@post, subdomain: @blog.subdomain), notice: t('crud.updated_successfully!', name: Post.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to @blog
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def set_blog
    user_id = Settings::Blog.find(params[:blog_id]).user_id
    @blog = Settings::Blog.find(params[:blog_id]) if check_user user_id
  end

  def set_post
    blog_id = Post.find(params[:id]).blog_id 
    @post = Post.find(params[:id]) if check_blog blog_id
  end

  # check the pramas if id really is current_user's
  def check_blog id
    blogs_id = current_user.blogs.map {|blog| blog.id}
    blogs_id.include?(id)
  end
  def check_user id
    user_id = current_user.id
    user_id == id
  end

end
