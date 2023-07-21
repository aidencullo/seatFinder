class ChangeMovie < ActiveRecord::Migration[7.0]
  def change
    change_table :movies do |t|
      t.rename :name, :title
    end
  end
end
