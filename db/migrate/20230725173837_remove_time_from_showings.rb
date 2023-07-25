class RemoveTimeFromShowings < ActiveRecord::Migration[7.0]
  def change
    remove_column :showings, :time, :time
  end
end
