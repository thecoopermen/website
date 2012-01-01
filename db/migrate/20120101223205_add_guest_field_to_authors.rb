class AddGuestFieldToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :guest, :boolean, default: false
  end
end
