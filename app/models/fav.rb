class Fav < ApplicationRecord
  t.belongs_to :user, class: User, foreign_key: user_id
  t.belongs_to :cocktail_bar, class: CocktailBar, foreign_key: cocktail_bar_id
end
