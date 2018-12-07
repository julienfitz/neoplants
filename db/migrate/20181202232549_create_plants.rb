class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :food_status, default: 10
      t.integer :mood_status, default: 10
      t.integer :water_status, default: 10
      t.integer :sunlight_status, default: 10
      t.string :disposition, default: "easygoing"
      t.integer :health_status, default: 10
      t.date :in_game_time, default: nil

      t.timestamps
    end
  end
end
