class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.references :user, null: false, foreign_key: true
      # t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
