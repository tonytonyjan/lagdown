class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  
  # Attributes related macros
  select2_white_list :email

  # association macros
  has_many :posts

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
