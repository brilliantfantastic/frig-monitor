class Beer < ActiveRecord::Base
  attr_accessible :abv, :name, :name_confirmation

  validates :name, confirmation: true
end
