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
