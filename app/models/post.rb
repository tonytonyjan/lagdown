class Post < ActiveRecord::Base
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :user

  # validation macros
  validates :title, :content, :user, presence: true

  # callbacks

  # other

  protected
  # callback methods
end
