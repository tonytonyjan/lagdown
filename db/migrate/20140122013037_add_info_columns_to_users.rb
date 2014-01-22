class AddInfoColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :homepage, :string
    add_column :users, :about, :text
  end
end
