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
      @user = User.find(current_user.id)
    end

end
