class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :reviewed_cocktail_bars, through: :reviews, foreign_key: :cocktail_bar_id
  has_many :favs
  has_many :faved_cocktail_bars, through: :favs, foreign_key: :cocktail_bar_id
  has_many :searches
  validates :name, :email, :password, presence: true;
  validates :name, :email, uniqueness: true;
  validates :password, length: { in: 6..10 }

end
