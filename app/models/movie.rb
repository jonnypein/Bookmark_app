class Movie < ApplicationRecord
  has_many :recommmendations
  has_many :bookmarks
end
