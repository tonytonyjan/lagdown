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

class Settings::Blog < Blog
end
