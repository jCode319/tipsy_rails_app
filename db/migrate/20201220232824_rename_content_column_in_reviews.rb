class RenameContentColumnInReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :content, :comment
  end
end
