class CocktailBar < ApplicationRecord
  belongs_to :search
  has_many :users, through: :reviews
  has_many :reviews

end
