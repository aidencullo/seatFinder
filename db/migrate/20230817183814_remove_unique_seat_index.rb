class RemoveUniqueSeatIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :tickets, column: [:seat], name: "index_tickets_on_seat"
  end
end
