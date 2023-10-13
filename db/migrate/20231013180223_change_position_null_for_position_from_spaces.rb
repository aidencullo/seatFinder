class ChangePositionNullForPositionFromSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column_null :spaces, :position, false
  end
end
