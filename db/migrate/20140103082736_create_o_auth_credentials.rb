class CreateOAuthCredentials < ActiveRecord::Migration
  def change
    create_table :o_auth_credentials do |t|
      t.references :user, index: true, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.json :auth_hash, null: false

      t.timestamps
    end
    add_index :o_auth_credentials, [:uid, :provider], unique: true
  end
end
