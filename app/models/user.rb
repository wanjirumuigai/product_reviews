class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product
    highest_rating = self.reviews.map { |review| review.star_rating }.max

    self.reviews.select do |item|
      item.product if item.star_rating == highest_rating
    end[
      0
    ].product
  end
end
