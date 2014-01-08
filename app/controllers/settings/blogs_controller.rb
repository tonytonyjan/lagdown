class Settings::BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to [:settings, @blog], notice: t('crud.created_successfully!', name: Blog.model_name.human)
    else
      render action: 'new'
    end
  end

  def edit
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name, :host_name, :user_id)
  end
end
