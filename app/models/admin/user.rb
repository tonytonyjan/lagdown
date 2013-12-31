class Admin::User < User
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  has_many :posts, class_name: Admin::Post

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
