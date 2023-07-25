class DropPostsTableReversible < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts do |t|
      t.string :title
      t.text :text
      t.timestamps null: false
    end
  end
end
