class Admin::BlogsController < ApplicationController
  include AdminConcern
  before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]
  authorize_resource instance_name: :admin_blog

  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @admin_blogs = Admin::Blog.page(params[:page])
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
  end

  # GET /admin/blogs/new
  def new
    @admin_blog = Admin::Blog.new
  end

  # GET /admin/blogs/1/edit
  def edit
  end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @admin_blog = Admin::Blog.new(admin_blog_params)

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to @admin_blog, notice: t('crud.created_successfully!', name: Admin::Blog.model_name.human) }
        format.json { render action: 'show', status: :created, location: @admin_blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/blogs/1
  # PATCH/PUT /admin/blogs/1.json
  def update
    respond_to do |format|
      if @admin_blog.update(admin_blog_params)
        format.html { redirect_to @admin_blog, notice: t('crud.updated_successfully!', name: Admin::Blog.model_name.human) }
        format.json { render action: 'show', status: :ok, location: @admin_blog }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @admin_blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog
      @admin_blog = Admin::Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_blog_params
      params.require(:admin_blog).permit(:name, :subdomain, :user_id)
    end
end
