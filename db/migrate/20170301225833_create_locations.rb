class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :weather
      t.text :address

      t.timestamps
    end
  end
end
