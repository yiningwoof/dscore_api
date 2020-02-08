class AddReferenceOfRoundsToScores < ActiveRecord::Migration[6.0]
  def change
    add_reference :scores, :round, index: true, foreign_key: true
  end
end
