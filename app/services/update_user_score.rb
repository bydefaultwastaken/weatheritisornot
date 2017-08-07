class UpdateUserScore
  # attr_accessor :score
  # attr_reader :location, :current_weather 
  # def initialize(score:, location:, current_weather:)
  #   @score = score
  #   @location = location
  #   @current_weather = current_weather    
  # end

  def call
    if @location.weather_guess.downcase == @current_weather.downcase
      @score.point_count = @score.point_count += 1
    #   @message = "Congratulations! You were correct. Your score is #{@score.point_count}. You can below to try guessing the weather at another location."
    # else 
    #   @message = "Sorry, click below to guess the weather at another location."
    end 
    @message = "hi"
  end

end  
