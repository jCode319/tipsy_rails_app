class User < ApplicationRecord
  has_many :cocktail_bar
  has_many :reviews
  has_many :cocktail_bars, through: :reviews

end
