class FrigesController < ApplicationController
  def show
    @frig = Refrigerator.find(params[:id])
  end

  def new
    @frig = Refrigerator.new
  end

  def create
    params[:refrigerator].merge!(user_id: current_user.id)
    @frig = Refrigerator.create(params[:refrigerator])
    if @frig.valid?
      redirect_to frige_path(@frig)
    else
      render :new
    end
  end
end
