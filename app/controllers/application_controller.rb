class ApplicationController < ActionController::Base
  protect_from_forgery

  def ensure_frig_visible(frig)
    visible = Refrigerator.for(current_user).include? frig
    not_found unless visible
  end

  def ensure_beer_in_frig(beer, frig)
    in_frig = frig.beers.include? beer
    not_found unless in_frig
  end

  def not_found
    render file: 'public/404', status: :not_found and return
  end
end
