class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :name, null: false
      t.text :weather_guess, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
