class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|

      t.timestamps
    end
  end
end
