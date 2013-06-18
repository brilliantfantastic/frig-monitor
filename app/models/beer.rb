class Beer < ActiveRecord::Base
  attr_accessible :abv, :name, :name_confirmation

  has_one :refrigerator

  validates :name, confirmation: true, presence: true, uniqueness: true
  validates :abv, format: { with: /^[0-9]{1,2}\.[0-9]{1,2}$/ }, allow_nil: true
end
