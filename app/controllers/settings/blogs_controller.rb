class Settings::BlogsController < ApplicationController
  include SettingsConcern
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @blogs = Settings::Blog.where(user_id: current_user.id).page(params[:page])
  end

  def show
    @posts = @blog.posts.page(params[:page])
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
    @blog = Settings::Blog.find(params[:id])
  end

  def blog_params
    params.require(:settings_blog).permit(:name, :subdomain)
  end
end
