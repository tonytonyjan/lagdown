class AddNameToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :name, :string, null: false
  end
end
