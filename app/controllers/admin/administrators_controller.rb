class Admin::AdministratorsController < ApplicationController
  include AdminConcern
  before_action :set_admin_administrator, only: [:show, :edit, :update, :destroy]
  authorize_resource instance_name: :admin_administrator

  # GET /admin/administrators
  # GET /admin/administrators.json
  def index
    @admin_administrators = Admin::Administrator.page(params[:page])
  end

  # GET /admin/administrators/1
  # GET /admin/administrators/1.json
  def show
  end

  # GET /admin/administrators/new
  def new
    @admin_administrator = Admin::Administrator.new
  end

  # GET /admin/administrators/1/edit
  def edit
  end

  # POST /admin/administrators
  # POST /admin/administrators.json
  def create
    @admin_administrator = Admin::Administrator.new(admin_administrator_params)

    respond_to do |format|
      if @admin_administrator.save
        format.html { redirect_to @admin_administrator, notice: t('crud.created_successfully!', name: Admin::Administrator.model_name.human) }
        format.json { render action: 'show', status: :created, location: @admin_administrator }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/administrators/1
  # PATCH/PUT /admin/administrators/1.json
  def update
    respond_to do |format|
      if @admin_administrator.update(admin_administrator_params)
        format.html { redirect_to @admin_administrator, notice: t('crud.updated_successfully!', name: Admin::Administrator.model_name.human) }
        format.json { render action: 'show', status: :ok, location: @admin_administrator }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/administrators/1
  # DELETE /admin/administrators/1.json
  def destroy
    @admin_administrator.destroy
    respond_to do |format|
      format.html { redirect_to admin_administrators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_administrator
      @admin_administrator = Admin::Administrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_administrator_params
      params.require(:admin_administrator).permit(:email, :password)
    end
end
