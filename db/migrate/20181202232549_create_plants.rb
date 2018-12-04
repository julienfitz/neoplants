class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :food_status
      t.integer :mood_status
      t.integer :water_status
      t.integer :sunlight_status
      t.string :disposition
      t.integer :health_status

      t.timestamps
    end
  end
end
