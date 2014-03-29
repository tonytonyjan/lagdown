class PostsController < ApplicationController
  before_action :set_blog, only: %i[index show]
  before_action :set_post, only: %i[show]
  authorize_resource
  layout 'blog'

  def index
    @posts = @blog.posts.page(params[:page])
  end

  def show
    description = LagdownRenderer.render(@post.content)[/<p>([^<].*)<\/p>/, 1]
    @meta_hash = {
      author: @blog.user.try(:nickname),
      description: description,
      generator: :lagdown
    }
    @og_hash = {
      title: @post.title,
      type:  :website,
      url: post_url(@post),
      description: description
    }
  end

  def preview
    render text: LagdownRenderer.render(params[:text].to_s)
  end

  private

  def set_blog
    @blog = Blog.find_by_subdomain! request.subdomain
  end

  def set_post
    @post = @blog.posts.find(params[:id])
  end
end
