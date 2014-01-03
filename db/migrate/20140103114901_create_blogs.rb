class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :host_name, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
