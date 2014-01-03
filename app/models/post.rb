# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

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
