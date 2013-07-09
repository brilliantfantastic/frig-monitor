class Refrigerator < ActiveRecord::Base
  attr_accessible :brand, :beers, :user_id

  belongs_to :user

  has_many :beers

  validates :user, presence: true
  validates :brand, presence: true

  def self.for(user)
    where(user_id: user.id)
  end
end
