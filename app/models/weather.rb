class Weather
  include ActiveModel::Model

  def self.get_weather_status(location_name)
    response = RestClient.get("https://query.yahooapis.com/v1/public/yql?q=select item.forecast from weather.forecast where woeid in (select woeid from geo.places(1) where text='#{location_name}') and u='c' limit 7&format=json")
    JSON.parse(response.body).dig("query", "results", "channel")
  end

end
