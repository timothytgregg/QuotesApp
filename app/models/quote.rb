class Quote < ActiveRecord::Base
  belongs_to :author
  has_many :collection_quotes
  has_many :collections, through: :collection_quotes
end
