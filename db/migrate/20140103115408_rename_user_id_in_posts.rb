class RenameUserIdInPosts < ActiveRecord::Migration
  def change
    rename_column(:posts, :user_id, :blog_id)
  end
end
