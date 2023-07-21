class AddTimeToShowings < ActiveRecord::Migration[7.0]
  def change
    add_column :showings, :time, :string
  end
end
