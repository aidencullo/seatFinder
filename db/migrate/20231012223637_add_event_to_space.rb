class AddEventToSpace < ActiveRecord::Migration[7.0]
  def change
    add_reference :spaces, :event, null: false, foreign_key: true
  end
end
