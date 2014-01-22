module SettingsConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    layout 'settings'
  end
end