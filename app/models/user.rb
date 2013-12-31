class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
