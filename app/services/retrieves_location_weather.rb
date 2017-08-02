require 'httparty'
class RetrievesLocationWeather(openweathermap_api_key, lat, lon)
  attr_reader :openweathermap_api_key, :lat, :lon

  def initialize(openweathermap_api_key:, lat:, lon:)
    @openweathermap_api_key = openweathermap_api_key 
    @lat = lat
    @lon = lon
  end

  def call
    url = "http://api.openweathermap.org/data/2.5/weather?lat=#{@lat}&lon=#{@lon}&appid=#{openweathermap_api_key}" 
    @response = HTTParty.get(url)
    weather_conditions = @response["weather"]
    @current_weather = weather_conditions[0]["main"] 
    @current_weather
  end

end  
