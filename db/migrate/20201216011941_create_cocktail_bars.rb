class CreateCocktailBars < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_bars do |t|
      t.string :name
      t.string :address
      t.float :rating
      # t.belongs_to :search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
