class Refrigerator
  attr_accessible :brand, :beers

  has_many :beers
end
