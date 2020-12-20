class AddAttributeToCocktailBars < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktail_bars, :phone_number, :string
    add_column :cocktail_bars, :yelp_url, :string
    add_column :cocktail_bars, :image_url, :string
    add_column :cocktail_bars, :yelp_id, :integer
  end
end
