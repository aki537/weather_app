class AddPrefectureRToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :prefecture_r, :string
  end
end
