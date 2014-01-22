class Admin::UsersController < ApplicationController
  include AdminConcern
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  authorize_resource instance_name: :admin_user

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = Admin::User.page(params[:page])
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = Admin::User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = Admin::User.new(admin_user_params)
    @admin_user.skip_confirmation!

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: t('crud.created_successfully!', name: Admin::User.model_name.human) }
        format.json { render action: 'show', status: :created, location: @admin_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    params[:admin_user].delete(:password) if admin_user_params[:password].blank?
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: t('crud.updated_successfully!', name: Admin::User.model_name.human) }
        format.json { render action: 'show', status: :ok, location: @admin_user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user).permit(:email, :password, :nickname, :about, :homepage)
    end
end
