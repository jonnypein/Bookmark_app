class AddRecommendationRefToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :recommendation, foreign_key: true
  end
end
