class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :body
      t.string :title
      t.timestamps null: false
    end
  end
end
