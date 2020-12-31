class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail_bar
  validates :user, :cocktail_bar, presence: true
end
