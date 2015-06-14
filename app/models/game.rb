class Game < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :consoles

  def meta_score
    reviews = self.reviews
    total = 0
    reviews.each do |review|
      total = review.score + total
    end
    total / reviews.count
  end

  def self.search query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
