class Settings::CategoriesController < ApplicationController
  include SettingsConcern
  before_action :set_cat , only: %i[destroy]

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

private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_cat
    @cat = Category.find(params[:id])
  end

end