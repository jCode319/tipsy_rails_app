class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.float :rating
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :cocktail_bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
