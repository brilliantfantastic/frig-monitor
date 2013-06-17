class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(params[:beer])
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end
  end
end
