class DropShowings < ActiveRecord::Migration[7.0]
  def change
        drop_table :showings
  end
end
