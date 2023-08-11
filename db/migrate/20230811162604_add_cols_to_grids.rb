class AddColsToGrids < ActiveRecord::Migration[7.0]
  def change
    add_column :grids, :cols, :integer
  end
end
