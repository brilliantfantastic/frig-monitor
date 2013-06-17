class BeveragesController < ApplicationController
  def index
    @frig = Refrigerator.new
    @frig.add_drink Beer.new(name: 'Edmond Fitzgerald', abv: 4.8)
    @frig.add_drink Beer.new(name: 'Hoppy IPA', abv: 8.9)
  end
end
