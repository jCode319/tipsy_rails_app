class CocktailBar < ApplicationRecord
  has_many :reviwed_users, through: :reviews, foreign_key: :user_id
  has_many :reviews
  has_many :faved_users, through: :favs, foreign_key: :user_id
  has_many :favs
end
