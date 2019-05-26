class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.belongs_to :episode, foreign_key: true
      t.string :name
      t.text :bio
      t.string :photo_url

      t.timestamps
    end
  end
end
