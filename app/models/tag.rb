class Tag < ApplicationRecord
  belongs_to :recommendation

  include PgSearch::Model
  pg_search_scope :search_by_tag_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
