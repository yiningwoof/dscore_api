class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :score
      t.references :round, null: false, foreign_key: true
      # t.references :hole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
