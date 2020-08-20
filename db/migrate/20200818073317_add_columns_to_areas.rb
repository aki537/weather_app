class AddColumnsToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :lat, :decimal, :precision => 10, :scale => 7
    add_column :areas, :lon, :decimal, :precision => 10, :scale => 7
  end
end
