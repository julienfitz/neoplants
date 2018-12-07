class AddAliveToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :alive, :boolean, default: true
  end
end
