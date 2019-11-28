class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :user
end
