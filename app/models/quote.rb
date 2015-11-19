class Quote < ActiveRecord::Base
  belongs_to :author
  has_many :favorites
  has_many :collections, through: :favorites
end
