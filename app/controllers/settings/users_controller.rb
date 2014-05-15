class Settings::UsersController < ApplicationController
  include SettingsConcern
  before_action :set_user, only: %i[edit update]
  authorize_resource

  def edit
  end

  def update
    if @user.update user_params
      redirect_to edit_settings_user_path, notice: t('crud.updated_successfully!', name: '')
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :about, :homepage, :avatar)
  end

  def set_user
    @user = current_user
  end
end
