class HomeController < ApplicationController
before_action :set_user, only: [:about]

  def index
  end


# 0508 edit
  def about
    @blogs = @user.blogs
    # Blog.joins(:posts).where(:user_id => 1).count
    @recent = Post.where(blog_id: @blogs.map{|b| b.id}).order(created_at: :desc).limit(13)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @blog = Blog.find_by(subdomain: request.subdomain)
        if @blog
          @user = @blog.user
        else
          @user = current_user
        end
    end

end
