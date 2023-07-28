class AddMovieIdToShowings < ActiveRecord::Migration[7.0]
  def change
    add_column :showings, :movie_id, :string
  end
end
