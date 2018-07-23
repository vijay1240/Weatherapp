class Api::V1::WeatherController < Api::BaseController

  def fetch_weather_status
    @forecast_data = Weather.get_weather_status(params[:location_name])
    if @forecast_data.present?
      respond_to do |format|
        format.json do
          render :json => @forecast_data.to_json
        end
      end
    else
      
    end
  end

end
