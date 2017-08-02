class AddCurrentWeatherToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :current_weather, :text
  end
end