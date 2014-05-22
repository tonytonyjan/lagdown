class Category < ActiveRecord::Base
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :blog
  has_many :posts
  # validation macros
  validates :name,:presence => true,:uniqueness => true
  # callbacks

  # other

  protected
  # callback methods
end
