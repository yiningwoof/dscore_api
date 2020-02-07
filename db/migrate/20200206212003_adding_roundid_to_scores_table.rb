class AddingRoundidToScoresTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :scores, :rounds, index: true, foreign_key: true
  end
end
