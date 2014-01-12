class UniqSubdomainToBlogs < ActiveRecord::Migration
  def up
    add_index :blogs, :subdomain, unique: true
  end

  def down
    remove_index :blogs, :subdomain
  end
end
