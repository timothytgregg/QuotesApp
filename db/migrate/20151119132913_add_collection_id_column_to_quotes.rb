class AddCollectionIdColumnToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :collection_id, :integer
  end
end
