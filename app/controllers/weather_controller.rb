require 'httparty'
class WeatherController < ApplicationController
  # before_action :set_location, only: [:show]

  # GET /location_weather
  def show
    url = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=#{Rails.application.secrets.openweathermap_api_key}" 
    @response = HTTParty.get(url)
    weather_conditions = @response["weather"]
    @current_weather = weather_conditions[0]["main"]  
  end
end

  # @weather = RetrievesLocationWeather.new(query: params[:Rails.application.secrets.amdoren_api_key, :location.latitude.floor(5), :location.longitude.floor(5)]).call

  # url = "https://www.amdoren.com/api/weather.php?api_key=#{Rails.application.secrets.amdoren_api_key}&lat=#{40.727639}&lon=#{-73.999985}"
      # url = 'https://www.amdoren.com/api/weather.php?api_key=#{@amdoren_api_key}&lat=#{lat}&lon=#{lon}'

  # GET /locations/1
  # def show
  # end

  # GET /locations/new
  # def new
  #   @location = Location.new
  # end

  # GET /locations/1/edit
  # def edit
  # end

  # POST /locations
  # def create
  #   service = CreatesLocation.new(location_params.to_h)
  #   service.call
  #   @location = service.location

  #   if service.success?
  #     redirect_to @location, notice: 'Location added.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /locations/1
  # def update
  #   if @location.update(location_params)
  #     redirect_to @location, notice: 'Location updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /locations/1
  # def destroy
  #   @location.destroy

  #   redirect_to locations_url, notice: 'Location deleted.'
  # end

#   private

#   def set_location
#     @location = Location.find(params[:id])
#   end

#   def location_params
#     params.require(:location).permit(:name, :weather, :address)
#   end
# end