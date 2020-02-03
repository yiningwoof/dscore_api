class AddGameRefToRounds < ActiveRecord::Migration[6.0]
  def change
    add_reference :rounds, :game, null: false, foreign_key: true
  end
end
