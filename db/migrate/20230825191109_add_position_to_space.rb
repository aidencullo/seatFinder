class AddPositionToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :position, :integer, null: false 
  end
end
