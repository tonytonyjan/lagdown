class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Settings.oauth_providers.each do |service|
    define_method service do
      @user = User.send("find_for_#{service}_oauth", request.env["omniauth.auth"], current_user)

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: service.humanize) if is_navigational_format?
      else
        puts @user.errors.full_messages
        session["devise.oauth_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
end