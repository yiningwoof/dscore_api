class AddNameToRounds < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :name, :string
  end
end
