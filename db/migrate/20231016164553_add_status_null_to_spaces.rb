class AddStatusNullToSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column_null :spaces, :status, false    
  end
end
