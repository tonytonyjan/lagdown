class AddSessionIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :session_id, :integer
  end
end
