class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.boolean :available

      t.timestamps
    end
  end
end
