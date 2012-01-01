class AddIconUrlToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :icon_url, :string
  end
end
