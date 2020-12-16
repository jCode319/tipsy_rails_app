class CreateFavs < ActiveRecord::Migration[6.0]
  def change
    create_table :favs do |t|
      t.integer :user
      t.integer :cocktail_bar

      t.timestamps
    end
  end
end
