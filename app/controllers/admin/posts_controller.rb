class Admin::PostsController < ApplicationController
  include AdminConcern
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  authorize_resource instance_name: :admin_post

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @admin_posts = Admin::Post.page(params[:page])
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = Admin::Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @admin_post = Admin::Post.new(admin_post_params)

    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to @admin_post, notice: t('crud.created_successfully!', name: Admin::Post.model_name.human) }
        format.json { render action: 'show', status: :created, location: @admin_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_post.update(admin_post_params)
        format.html { redirect_to @admin_post, notice: t('crud.updated_successfully!', name: Admin::Post.model_name.human) }
        format.json { render action: 'show', status: :ok, location: @admin_post }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post = Admin::Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_post_params
      params.require(:admin_post).permit(:title, :content, :blog_id)
    end
end
