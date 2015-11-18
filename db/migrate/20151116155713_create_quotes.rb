class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :source
      t.string :auteur
      t.integer :author_id
      t.integer :year

      t.timestamps null: false
    end
  end
end
