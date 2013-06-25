class BeveragesController < ApplicationController
  def index
    @frig = Refrigerator.create
    @frig.beers << Beer.new(name: 'Edmond Fitzgerald', abv: 4.8)
    @frig.beers << Beer.new(name: 'Hoppy IPA', abv: 8.9)
  end
end
