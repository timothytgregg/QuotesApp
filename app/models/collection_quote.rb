class CollectionQuote < ActiveRecord::Base
  belongs_to :quote
  belongs_to :collection
end
