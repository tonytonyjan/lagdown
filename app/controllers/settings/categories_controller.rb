class Settings::CategoriesController < ApplicationController
  include SettingsConcern
  before_action :set_cat , only: %i[destroy update]
  before_action :set_blog , only: %i[index create]

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

  def index
    @category = Category.new
  end

  def update
    @cat.update params.permit(:blog_id)
    redirect_to settings_categories_path
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