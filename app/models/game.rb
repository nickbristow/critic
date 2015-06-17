class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :users, through: :userreviews
  has_many :userreviews
  has_and_belongs_to_many :consoles
  has_attached_file :boxart, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :boxart, :content_type => /\Aimage\/.*\Z/


  def meta_score
    if self.reviews.any?
      reviews = self.reviews
      total = 0
      reviews.each do |review|
        total = review.score + total
      end
      total / reviews.count
    else
      "N/A"
    end
  end

  def weighted_meta_score
    if self.reviews.any?
      reviews = self.reviews
      total = 0
      reviews.each do |review|
        total = review.score + total
      end
      total / reviews.count
    else
      "N/A"
    end
  end


  def self.search query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
