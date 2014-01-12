class Blog < ActiveRecord::Base
  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  
  # Attributes related macros
  select2_white_list :subdomain

  # association macros
  belongs_to :user
  has_many :posts, dependent: :destroy

  # validation macros
  validates :user, :subdomain, presence: true

  # callbacks

  # other

  protected
  # callback methods
end
