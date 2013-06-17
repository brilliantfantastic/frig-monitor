class BeveragesController < ApplicationController
  # Solution to lab 3 part 3
  # def index
  #   beer = Beer.new('Edmond Fitzgerald', '8.7')
  #   render test: "My Favorite beer is #{beer.name}"
  # end

  # Solution to lab 4
  def index
    @frig = Refrigerator.new
    @frig.add_drink Beer.new(name: 'Edmond Fitzgerald', abv: 4.8)
    @frig.add_drink Beer.new(name: 'Hoppy IPA', abv: 8.9)
  end
end
