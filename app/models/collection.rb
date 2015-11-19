class Collection < ActiveRecord::Base
  has_many :favorites
  has_many :quotes, through: :favorites
end

#nice job tackling many-to-many relationships! Those are so tricky
