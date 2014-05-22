class Settings::CategoriesController < ApplicationController
  include SettingsConcern
  before_action :set_cat , only: %i[destroy update edit show]
  before_action :set_blogs , only: %i[index create edit show]
  before_action :set_index , only: %i[index create]

  def index
    @category = Category.new
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
    @cat.posts.each do |p|
        p.update_columns(:category_id => nil)
    end if @cat.destroy

    redirect_to settings_categories_path
  end

  def edit
    @category = @cat
    @detail = {
      :title => t('category.edit')+ " => "+ @cat.name,
      :gly_type =>'glyphicon-edit',
      :action =>'update'}
  end

  def update
    @cat.update category_params
    redirect_to settings_categories_path
  end

  def show
    if @cat.update params.permit(:blog_id)
      @cat.posts.each do |p|
        p.update_columns(:category_id => nil)
      end
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

  def set_blogs
    @blogs = current_user.blogs
  end

  def set_cat
    blog_id =  Category.find(params[:id]).blog_id
    @cat = Category.find(params[:id]) if check_blog blog_id
  end

  # check the pramas if id really is current_user's
  def check_blog id
    blogs_id = current_user.blogs.map {|blog| blog.id}
    blogs_id.include?(id)
  end

  def set_index
    @list = []
    @blogs.each do |b| 
      @list.push({:name => b.name,:id => b.id})
    end
    # 尚未分類's categroy_list
    # @list.push({:name =>'尚未分類',:id => nil})

    @detail = {
    title: t('category.add'),
    gly_type: 'glyphicon-plus-sign',
    action: 'create'}
  end
end