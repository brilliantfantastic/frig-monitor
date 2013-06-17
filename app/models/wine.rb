require_relative 'alcoholic_beverage'

class Wine < AlcoholicBeverage
  def initialize(name, abv, color)
    super name, abv
    @color = color
  end

  def color
    @color
  end

  def best_served
    @color == :white ? :cold : :warm
  end
end
