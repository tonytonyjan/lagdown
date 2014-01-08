class PostsController < ApplicationController
  before_action :set_blog
  before_action :set_post, only: %i[show]

  def index
    @posts = @blog.posts.page(params[:page])
  end

  def show
  end

  private

  def set_blog
    @blog = Blog.find_by_host_name request.subdomain
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
