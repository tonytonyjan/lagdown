# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  nickname               :string(255)
#  homepage               :string(255)
#  about                  :text
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: Settings.oauth_providers
  
  #avatar         
  mount_uploader :avatar, AvatarUploader

  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  
  # Attributes related macros
  select2_white_list :email

  # association macros
  has_many :blogs, dependent: :destroy
  has_many :o_auth_credentials, dependent: :destroy

  # validation macros

  # callbacks

  # other
  Settings.oauth_providers.each do |service|
    define_singleton_method("find_for_#{service}_oauth") do |auth, signed_in_resource=nil|
      o_auth_credential = OAuthCredential.find_or_initialize_by provider: auth.provider, uid: auth.uid
      if o_auth_credential.persisted?
        o_auth_credential.update! auth_hash: auth
        o_auth_credential.user
      else
        user = User.find_by(email: auth.info.email) || User.new(
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
        ).tap{ |u| u.skip_confirmation!; u.save}
        if user.persisted?
          user.o_auth_credentials.create!(
            provider: auth.provider,
            uid: auth.uid,
            auth_hash: auth
          )
        end
        user
      end
    end
  end

  protected
  # callback methods
end
