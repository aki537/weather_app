class CreateCommentEvaluates < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_evaluates do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
