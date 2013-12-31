class Admin::Administrator < ActiveRecord::Base
  devise :database_authenticatable, :timeoutable, :rememberable, :trackable, :validatable
end
