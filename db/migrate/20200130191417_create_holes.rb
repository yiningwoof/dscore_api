class CreateHoles < ActiveRecord::Migration[6.0]
  def change
    create_table :holes do |t|
      t.float :lat
      t.float :lng
      t.string :pic
      t.integer :par

      t.timestamps
    end
  end
end
