class CreateCollectionquotesTable < ActiveRecord::Migration
  def change
    create_table :collection_quotes do |t|
      t.references :quote
      t.references :collection
    end
  end
end
