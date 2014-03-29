class PostsController < ApplicationController
  before_action :set_blog, only: %i[index show]
  before_action :set_post, only: %i[show]
  authorize_resource
  layout 'blog'

  def index
    @posts = @blog.posts.page(params[:page])
  end

  def show
    @og_hash = {
      title: @post.title,
      type:  :website,
      url: post_url(@post),
      description: @post.content
    }
  end

  def preview
    render text: RDiscount.new(params[:text].to_s, :no_superscript).to_html
  end

  private

  def set_blog
    @blog = Blog.find_by_subdomain! request.subdomain
  end

  def set_post
    @post = @blog.posts.find(params[:id])
  end
end
