class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.belongs_to :network, foreign_key: true
      t.string :title
      t.text :description
      t.date :published_at
      t.string :logo_url
      t.boolean :premium
      t.integer :tier_required
      t.string :trailer_url
      t.string :slug
      t.string :type_from_feed
      t.string :sort_direction
      t.date :latest_episode_published_at
      t.boolean :seasoned

      t.timestamps
    end
  end
end
