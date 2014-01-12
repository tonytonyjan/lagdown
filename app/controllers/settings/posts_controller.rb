class Settings::PostsController < ApplicationController
  before_action :set_blog
  before_action :set_post, only: %i[show edit update destroy]

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
      redirect_to post_url(@post, host: Settings.host, subdomain: @blog.subdomain), notice: t('crud.created_successfully!', name: Post.model_name.human)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to @blog
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_blog
    @blog = Settings::Blog.find(params[:blog_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
