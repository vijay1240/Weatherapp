class SiteController < ApplicationController

  def index
  end

  def fetch_weather_info
    @forecast = Weather.get_weather_status(params[:location_name])
    respond_to do |format|
      format.js
    end
  end

end
