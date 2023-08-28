class AddGridToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :spaces, :grid, null: false, foreign_key: true,
                  index: true
  end
end
