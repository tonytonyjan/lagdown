class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
