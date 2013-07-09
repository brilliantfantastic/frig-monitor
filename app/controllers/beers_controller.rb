class BeersController < ApplicationController
  before_filter :require_login

  def show
    frig = Refrigerator.find(params[:frige_id])
    ensure_frig_visible frig
    @beer = Beer.find(params[:id])
    ensure_beer_in_frig @beer, frig
  end

  def new
    @frig = Refrigerator.find(params[:frige_id])
    ensure_frig_visible @frig
    @beer = Beer.new
  end

  def create
    @frig = Refrigerator.find(params[:frige_id])
    ensure_frig_visible @frig
    @beer = @frig.beers.new(params[:beer])
    if @beer.save
      redirect_to frige_beer_path(@frig, @beer)
    else
      render :new
    end
  end
end
