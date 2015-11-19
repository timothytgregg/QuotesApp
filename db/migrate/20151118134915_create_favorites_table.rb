class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :quote, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
    end
  end
end
