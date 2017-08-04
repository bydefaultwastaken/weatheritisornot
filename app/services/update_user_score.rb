class UpdateUserScore
  attr_accessor :user
  attr_reader :location
  def initialize(user:)
    @user = user 
  end

  def call
    if @location.weather.downcase == @current_weather.downcase
      @user.score = @user.score += 1
    #   @message = "Congratulations! You were correct. Your score is #{@user.score}. You can below to try guessing the weather at another location."
    # else 
    #   @message = "Sorry, click below to guess the weather at another location."
    end 
    @message = "hi"
  end

end  
