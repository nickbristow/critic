class Game < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :consoles
end
