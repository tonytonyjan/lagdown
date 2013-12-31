class Admin::Post < Post
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :user, class_name: Admin::User

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
