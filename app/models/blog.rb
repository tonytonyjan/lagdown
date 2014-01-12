class Blog < ActiveRecord::Base
  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  SUBDOMAIN_BLACK_LIST = %w[www admin api xdite]
  
  # Attributes related macros
  select2_white_list :subdomain

  # association macros
  belongs_to :user
  has_many :posts, dependent: :destroy

  # validation macros
  validates :user, :name, :subdomain, presence: true
  validates :subdomain, uniqueness: true, exclusion: { in: SUBDOMAIN_BLACK_LIST }

  # callbacks

  # other

  protected
  # callback methods
end
