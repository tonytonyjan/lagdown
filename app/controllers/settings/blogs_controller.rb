class Settings::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @blogs = current_user.blogs.page(params[:page])
  end

  def show
  end

  def new
    @blog = Settings::Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

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

  private
  def set_blog
    @blog = Settings::Blog.find(params[:id])
  end

  def blog_params
    params.require(:settings_blog).permit(:name, :subdomain, :user_id)
  end
end
