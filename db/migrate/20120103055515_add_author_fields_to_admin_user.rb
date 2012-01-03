class AddAuthorFieldsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :name,     :string
    add_column :admin_users, :twitter,  :string
    add_column :admin_users, :bio,      :text
    add_column :admin_users, :guest,    :boolean, :default => false
    add_column :admin_users, :icon_url, :string
  end
end
