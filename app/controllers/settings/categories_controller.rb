class Settings::CategoriesController < ApplicationController
  include SettingsConcern
  before_action :set_cat , only: %i[destroy update edit show]
  before_action :set_blog , only: %i[index create edit show]

  def index
    @category = Category.new
    @list = []
    @blogs.each do |b| 
      @list.push({:name => b.name,:id => b.id})
    end
    @list.push({:name =>'尚未分類',:id => nil})
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        # redirect_to 'index'
        redirect_to settings_categories_path
      else
        render :index
      end
  end

  def destroy
    @cat.destroy
    redirect_to settings_categories_path
  end

  def edit
    @category = @cat
  end

  def update
    @cat.update category_params
    redirect_to settings_categories_path
  end

  def show
    if @cat.update params.permit(:blog_id)
    redirect_to settings_categories_path
    else
    render 'index'
    end
  end

private
  def category_params
    params.require(:category).permit(:name,:blog_id)
  end

  def blog_params
    params.require(:blog).permit(:blog_id)
  end

  def set_cat
    @cat = Category.find(params[:id])
  end

  def set_blog
    @blogs = current_user.blogs
  end
end