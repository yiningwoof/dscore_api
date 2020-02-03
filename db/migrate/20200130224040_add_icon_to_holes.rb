class AddIconToHoles < ActiveRecord::Migration[6.0]
  def change
    add_column :holes, :icon, :string
  end
end
