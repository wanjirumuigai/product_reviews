class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    Review.create(
      star_rating: star_rating,
      comment: comment,
      product_id: self.id,
      user_id: user.id
    )
  end

  def print_all_reviews
    self
      .reviews
      .map do |review|
        puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
      end
      .compact
  end
  def average_rating
    rating = self.reviews.map { |rating| rating.star_rating }
    rating.sum / rating.count
  end
end
