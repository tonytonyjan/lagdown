module AdminConcern
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with name: Settings.http_auth_name, password: Settings.http_auth_password unless Rails.env.development?
    before_action :authenticate_administrator!
    layout 'admin'
  end

  private
  def current_ability
    @current_ability ||= AdminAbility.new(current_administrator)
  end
end