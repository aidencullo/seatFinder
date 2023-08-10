class AddRowsToGrid < ActiveRecord::Migration[7.0]
  def change
    add_column :grids, :rows, :integer
  end
end
