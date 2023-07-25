class ChangeDateTypeShowings < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :showings do |t|
        dir.up   { t.change :date, :datetime }
        dir.down { t.change :date, :string }
      end
    end
  end
end
