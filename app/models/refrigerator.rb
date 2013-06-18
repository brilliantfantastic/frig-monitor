class Refrigerator < ActiveRecord::Base
  attr_accessible :brand, :beers

  has_many :beers
end
