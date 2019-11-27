class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :tags

end
