# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  subdomain  :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)      not null
#

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
  has_many :categories
  # validation macros
  validates :user, :name, :subdomain, presence: true
  validates :subdomain, uniqueness: true, exclusion: { in: SUBDOMAIN_BLACK_LIST }
  validate :limit_blog_number, on: :create

  # callbacks
  before_save :downcase
  # other

  protected
  # callback methods
  def limit_blog_number
    errors.add(:base, :too_many_blogs) if user.blogs.size > 3
  end

  def downcase
    self.subdomain = self.subdomain.downcase
  end
end
