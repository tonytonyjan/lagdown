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
#

class Admin::Post < Post
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :blog, class_name: Admin::Blog

  # validation macros

  # callbacks

  # other

  protected
  # callback methods
end
