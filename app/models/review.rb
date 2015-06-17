class Review < ActiveRecord::Base
  belongs_to :game
  belongs_to :editor
  validates :link, :format => URI::regexp(%w(http https))
  
end
