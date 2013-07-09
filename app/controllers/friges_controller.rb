class FrigesController < ApplicationController
  before_filter :require_login

  def index
    @friges = Refrigerator.for(current_user)
  end

  def show
    @frig = Refrigerator.find(params[:id])
    ensure_frig_visible @frig
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
