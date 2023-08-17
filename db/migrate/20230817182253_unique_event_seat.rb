class UniqueEventSeat < ActiveRecord::Migration[7.0]
  def change
    add_index :tickets, [:seat, :event_id], unique: true
  end
end
