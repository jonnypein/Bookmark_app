class Movie < ApplicationRecord
  has_many :recommendations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
