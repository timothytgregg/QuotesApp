class Collection < ActiveRecord::Base
  has_many :collection_quotes
  has_many :quotes, through: :collection_quotes
end
