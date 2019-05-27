class AddCategoryToShows < ActiveRecord::Migration[5.2]
  def change
    add_reference :shows, :category, foreign_key: true
  end
end
