class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  # after_action :location_weather_update, only: [:show, :edit, :update, :destroy]

  # GET /locations
  def index
    @locations = SearchesLocations.new(query: params[:q]).call
  end

  # GET /locations/1
  def show
    @location ||= Location.find(params[:id])
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  def create
    service = CreatesLocation.new(location_params.to_h)
    service.call
    @location = service.location

    if service.success?
      redirect_to @location, notice: 'Location added.'
    else
      render :new
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location updated.'
    else
      render :edit
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy

    redirect_to locations_url, notice: 'Location deleted.'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :weather_guess, :address)
  end
  

  # def location_weather_update
  #   @location.current_weather = RetrievesLocationWeather.new(:Rails_application_secrets_openweathermap_api_key, :latitude, :longitude).call 
  # end  

end
