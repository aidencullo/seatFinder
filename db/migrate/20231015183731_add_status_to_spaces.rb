class AddStatusToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :status, :string
  end
end
