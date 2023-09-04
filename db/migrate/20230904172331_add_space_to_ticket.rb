class AddSpaceToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :space, null: false, foreign_key: true
    remove_reference :spaces, :space, null: false, foreign_key: true
  end
end
