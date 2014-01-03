# == Schema Information
#
# Table name: o_auth_credentials
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  provider   :string(255)      not null
#  uid        :string(255)      not null
#  auth_hash  :json             not null
#  created_at :datetime
#  updated_at :datetime
#

class OAuthCredential < ActiveRecord::Base
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :user

  # validation macros
  validates :user, :provider, :uid, :auth_hash, presence: true

  # callbacks

  # other

  protected
  # callback methods
end
