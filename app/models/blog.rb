class Blog < ActiveRecord::Base
  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  
  # Attributes related macros
  select2_white_list :host_name

  # association macros
  belongs_to :user
  has_many :posts, dependent: :destroy

  # validation macros
  validates :user, :host_name, presence: true

  # callbacks

  # other

  protected
  # callback methods
end
