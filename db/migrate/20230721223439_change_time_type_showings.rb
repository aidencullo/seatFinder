class ChangeTimeTypeShowings < ActiveRecord::Migration[7.0]
  def change
    change_table :showings do |t|
      t.change :time, :time
    end
  end
end
