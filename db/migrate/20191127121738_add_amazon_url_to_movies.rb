class AddAmazonUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :amazon_url, :string
  end
end
