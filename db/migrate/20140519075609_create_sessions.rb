class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :ip

      t.timestamps
    end
  end
end
