class BeersController < ApplicationController
  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create(params[:beer])
    redirect_to beer_path(@beer)
  end
end
