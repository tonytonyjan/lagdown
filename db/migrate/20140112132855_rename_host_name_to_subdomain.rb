class RenameHostNameToSubdomain < ActiveRecord::Migration
  def change
    rename_column(:blogs, :host_name, :subdomain)
  end
end
