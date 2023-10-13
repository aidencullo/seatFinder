class RemoveNullConstraintForPositionFromSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column_null :spaces, :position, true
  end
end
