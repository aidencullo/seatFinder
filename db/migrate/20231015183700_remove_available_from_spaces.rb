class RemoveAvailableFromSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaces, :available, :boolean
  end
end
