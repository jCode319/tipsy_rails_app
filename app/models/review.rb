class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail_bar
end
