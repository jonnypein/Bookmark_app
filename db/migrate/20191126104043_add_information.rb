class AddInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :picture_url, :string
    add_column :movies, :description, :string
    add_column :movies, :genre, :string
    add_column :movies, :year, :integer
  end
end
