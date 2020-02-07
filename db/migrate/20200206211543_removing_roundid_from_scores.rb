class RemovingRoundidFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :scores, :round_id
  end
end
