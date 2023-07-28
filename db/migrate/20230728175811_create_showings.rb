class CreateShowings < ActiveRecord::Migration[7.0]
  def change
    create_table :showings do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
