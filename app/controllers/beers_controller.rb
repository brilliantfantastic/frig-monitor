class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @frig = Refrigerator.find(params[:frige_id])
    @beer = Beer.new
  end

  def create
    @frig = Refrigerator.find(params[:frige_id])
    @beer = @frig.beers.new(params[:beer])
    if @beer.save
      redirect_to frige_beer_path(@frig, @beer)
    else
      render :new
    end
  end
end
