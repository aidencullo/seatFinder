class TryUniqueTicketSeat1 < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :seat, :integer
    add_column :tickets, :seat, :integer, unique: true
  end
end
