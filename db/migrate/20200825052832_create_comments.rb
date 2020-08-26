class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :weather, default: 0
      t.integer :temp
      t.integer :humidity
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
