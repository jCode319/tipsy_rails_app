class Search < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cocktail_bars
end
