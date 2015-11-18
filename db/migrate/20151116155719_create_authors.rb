class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :full_name
      t.integer :birthyear
      t.integer :deathyear

      t.timestamps null: false
    end
  end
end
