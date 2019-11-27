class AddNetflixUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :netflix_url, :string
  end
end
