class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :twitter
      t.text :bio

      t.timestamps
    end
  end
end
