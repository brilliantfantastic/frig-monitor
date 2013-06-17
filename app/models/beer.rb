class Beer < ActiveRecord::Base
  attr_accessible :abv, :name

  validates :name, presence: true, uniqueness: true
  validates :abv, presence: true
end
