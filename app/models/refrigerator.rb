class Refrigerator
  attr_reader :drinks
  attr_accessor :capacity

  def initialize(attrs = {})
    @drinks = attrs[:drinks] ? attrs[:drinks] : []
    @capacity = attrs[:capacity] ? attrs[:capacity] : 12
  end

  def count
    @drinks.count
  end

  def full?
    count == @capacity
  end

  def empty?
    count == 0
  end

  def add_drink(drink)
    @drinks << drink unless full?
  end

  def remove_drink
    @drinks.delete_at(0) unless empty?
  end
end
