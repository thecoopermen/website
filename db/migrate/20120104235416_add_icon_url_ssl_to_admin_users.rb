class AddIconUrlSslToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :icon_url_ssl, :string
  end
end
