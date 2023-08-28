class AddNonNullToSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column_null :spaces, :available, true
  end
end
