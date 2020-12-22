class AddSearchIdToCocktailBars < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktail_bars, :search_id, :integer
    add_index :cocktail_bars, :search_id
  end
end
