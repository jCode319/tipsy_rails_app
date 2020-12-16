class CreateFavs < ActiveRecord::Migration[6.0]
  def change
    create_table :favs do |t|
      t.integer :user_id
      t.integer :cocktail_bar_id

      t.timestamps
    end
  end
end
