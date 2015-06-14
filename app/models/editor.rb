class Editor < ActiveRecord::Base
  has_many :reviews

  def self.search query
    where('name LIKE :query', query: "%#{query}%")
  end
end
