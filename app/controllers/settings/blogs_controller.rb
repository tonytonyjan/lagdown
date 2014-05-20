class Settings::BlogsController < ApplicationController
  include SettingsConcern
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @blogs = Settings::Blog.where(user_id: current_user.id).page(params[:page])
  end

  def show
    if params[:category_id] == "null"
      @posts = @blog.posts.order(created_at: :desc).where(category_id: nil).page(params[:page]).per(10)      
    elsif params[:category_id] 
      @posts = @blog.posts.order(created_at: :desc).where(category_id: params[:category_id]).page(params[:page]).per(10)
    else
      @posts = @blog.posts.order(created_at: :desc).page(params[:page]).per(10)
    end
    @cat_nil = @blog.posts.where(category_id: nil).count
  end

  def new
    @blog = Settings::Blog.new
  end

  def create
    @blog = Settings::Blog.new(blog_params)
    @blog.user = current_user

    if @blog.save
      redirect_to @blog, notice: t('crud.created_successfully!', name: Settings::Blog.model_name.human)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update blog_params
      redirect_to @blog, notice: t('crud.updated_successfully!', name: Settings::Blog.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to Settings::Blog
  end

  private
  def set_blog
    # 有漏洞，可藉由網址參數直接訪問網頁
    # @blog = Settings::Blog.find(params[:id])

    # 藉由判斷 user_id = current_user.id 來斷定使用者，是否有更好的解法？
    user_id = Settings::Blog.find(params[:id]).user_id
    @blog = Settings::Blog.find(params[:id]) if user_id == current_user.id
  end

  def blog_params
    params.require(:settings_blog).permit(:name, :subdomain)
  end

end
