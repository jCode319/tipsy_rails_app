class Search < ApplicationRecord
  belongs_to :user
  has_many :cocktail_bars
end
