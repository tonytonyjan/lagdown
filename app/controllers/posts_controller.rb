class PostsController < ApplicationController
  before_action :set_blog

  def index
    @posts = @blog.posts.page(params[:page])
  end

  def set_blog
    @blog = Blog.find_by_host_name request.subdomain
  end
end
