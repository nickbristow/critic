class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :users, through: :userreviews
  has_many :userreviews
  has_and_belongs_to_many :consoles
  has_attached_file :boxart, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :boxart, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true



  def meta_score user_id=nil
    if self.reviews.any?
      if user_id
        weighted_meta_score user_id
      else
        normal_meta_score
      end
    else
      "N/A"
    end
  end

  def normal_meta_score
    reviews = self.reviews
    total = 0
    reviews.each do |review|
      unless review.id.nil?
        total = review.score + total
      end
    end
    total / reviews.count
  end

  def weighted_meta_score user_id
    if self.reviews.any?
      reviews = self.reviews
      total = 0
      reviews_count = 0
      weighted_reviews = []

      ############################################
      #Figure out the weight of each add to toatal
      ############################################
      reviews.each do |review|
        unless review.id.nil?
          metaweight = Metaweight.where("user_id = :user_id AND editor_id = :editor_id", 
                                    {user_id: user_id, editor_id: review.editor.id})
          if metaweight.any?
            weighted_reviews << {review: review, weight: metaweight.last.weight}
          else
            weighted_reviews << {review: review, weight: 100000.0}
          end
        end
      end
      weighted_reviews = weighted_reviews.sort_by {|h| h[:weight]}
      weighted_reviews.reverse!

      mult = 2
      weighted_reviews.each_with_index do |weighted_review, index|
        unless weighted_review.nil?
          if weighted_review[:weight] > 10000.0
            total = weighted_review[:review].score + total
            reviews_count = reviews_count + 1
          else
            total = (weighted_review[:review].score * mult) + total
            reviews_count = reviews_count + mult
            mult = mult + 1
          end
        end
      end
      if reviews_count == 0
        'N/A'
      else
        total / reviews_count
      end
      ############################################
      #/end
      ############################################
    else
      "N/A"
    end
  end


  def self.search query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
