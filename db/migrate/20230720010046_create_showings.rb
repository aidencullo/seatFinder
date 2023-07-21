class CreateShowings < ActiveRecord::Migration[7.0]
  def change
    create_table :showings do |t|
      t.string :date
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
