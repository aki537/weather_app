class ChangePrefectureToArea < ActiveRecord::Migration[5.2]
  def change
    change_column :areas, :prefecture, :string
  end
end
