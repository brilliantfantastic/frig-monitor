class AlcoholicBeverage
  attr_reader :name, :abv

  def initialize(name, abv)
    @name = name
    @abv = abv
    @remaining_drinks = 10
  end

  def drink
    @remaining_drinks -= 1
  end

  def empty?
    @remaining_drinks == 0
  end

  def full?
    @remaining_drinks == 10
  end
end
