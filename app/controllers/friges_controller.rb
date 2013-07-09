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
    respond_to do |format|
      format.js
      format.html do
        render :new and return unless @frig.valid?
        redirect_to frige_path(@frig)
      end
    end
  end
end
