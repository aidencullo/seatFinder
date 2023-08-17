class AddSeatsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :seat, :integer
  end
end
