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

class Admin::Blog < Blog
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :user, class_name: Admin::User
  has_many :posts, class_name: Admin::Post, dependent: :destroy

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
