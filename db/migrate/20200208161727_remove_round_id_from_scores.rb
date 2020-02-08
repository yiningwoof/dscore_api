class RemoveRoundIdFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :scores, :rounds_id
  end
end
