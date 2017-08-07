require 'httparty'
class ScoresController < LocationsController
  # before_action :authenticate_user!
  before_action :set_score, only: [:show]
  # before_action :find_user, only: [:index]
  # GET /location_weather
  # @score = Score.new(params[:point_count])

  # def index
  #   @scores = SearchesScores.new(query: params[:q]).call
  # new  
  # end

  def show
    url = "http://api.openweathermap.org/data/2.5/weather?lat=#{@location.latitude.floor(5)}&lon=#{@location.longitude.floor(5)}&appid=#{Rails.application.secrets.openweathermap_api_key}"
    @response = HTTParty.get(url)
    weather_conditions = @response["weather"]
    @current_weather = weather_conditions[0]["main"]
    if @location.weather_guess.downcase == @current_weather.downcase
      # @score.point_count += 1
      # @score.increment!(:point_count)
      @score.update_attribute(:point_count, @score.point_count+1)
      @score.save
      @message = "Congratulations! You were correct! Click below to guess again."
        # @message = "Congratulations! You were correct! Your score is: #{@score.point_count}."
        
    else
      @message = "Sorry, click below to return and try to guess the weather at another location."
    end
  # @message = ScoresHelper::ScoreMessage.new
  end

    # @message = point_message(@location, @current_weather) 
    # service = UpdateUserScore.new
    # service.call
  # end

  # GET /location_weather
  # def show  
  #   @location ||= Location.find(params[:location_id])
  #   @user ||= User.find(params[:user_id])
  # end  

# PATCH/PUT /user_score
  # def update
  # end

private
  def set_score
    @score ||= Score.new(params[:point_count])
  end

  # def score_params
  #   params.require(:score).permit(:point_count)
    # @location = Location.find(params[:location_id])
  # end

  # def find_user
  #   @user = User.find params[:user_id]
  # end

end


































 
# private

#   def set_user
#     @user = User.find(params[:id])
#   end

#   def user_params
#     params.require(:user).permit(:email, :score)
#   end
# end

  
  # @location = Location.find(params[@location_id])
    # @current_weather = RetrievesLocationWeather.new(query: params[Rails.application.secrets.openweathermap_api_key, location.latitude.floor, location.longitude.floor]).call
  
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



  # DELETE /locations/1
  # def destroy
  #   @location.destroy

  #   redirect_to locations_url, notice: 'Location deleted.'
  # end


# end