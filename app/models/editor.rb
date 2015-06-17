class Editor < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :users, through: :metaweight
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search query
    where('name LIKE :query', query: "%#{query}%")
  end
end
