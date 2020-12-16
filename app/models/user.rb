class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_cocktail_bars, through: :reviews, foreign_key: :cocktail_bar_id
  has_many :favs
  has_many :faved_cocktail_bars, through: :favs, foreign_key: :cocktail_bar_id
  has_secure_password
end
