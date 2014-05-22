# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  blog_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  view_count :integer          default:0

class Post < ActiveRecord::Base
  # scope macros
  
  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :blog

  # validation macros
  validates :title, :content, :blog, presence: true

  # callbacks

  # other

  protected
  # callback methods
end
