class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :point_count, default: 0, null: false
      t.timestamps
    end
  end
end
