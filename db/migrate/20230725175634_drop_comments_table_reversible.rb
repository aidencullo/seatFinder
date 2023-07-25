class DropCommentsTableReversible < ActiveRecord::Migration[7.0]
  def change
    drop_table :comments do |t|
      t.integer :post_id
      t.text :text
      t.timestamps null: false
    end
  end
end
