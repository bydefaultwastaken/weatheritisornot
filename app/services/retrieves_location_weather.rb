require 'httparty'
class RetrievesLocationWeather
  attr_reader :openweathermap_api_key, :lat, :lon

  def initialize(openweathermap_api_key, lat, lon)
    self.openweathermap_api_key = openweathermap_api_key 
    self.lat = lat
    self.lon = lon
  end

  def call
    url = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=#{Rails.application.secrets.openweathermap_api_key}" 
    @response = HTTParty.get(url)
    weather_conditions = @response["weather"]
    @current_weather = weather_conditions[0]["main"] 
    @current_weather
  end
  
end  
  
  
 
