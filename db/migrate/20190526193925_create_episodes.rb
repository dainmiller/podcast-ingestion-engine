class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.belongs_to :show, foreign_key: true
      t.text :description
      t.string :episode_number
      t.date :published_at
      t.string :guid
      t.string :slug
      t.integer :earwolf_id
      t.integer :stitcher_id
      t.integer :stagebloc_id
      t.integer :wolfpub_id
      t.string :youtube_url
      t.string :art19_url
      t.text :streaming_url
      t.text :download_url
      t.boolean :premium

      t.timestamps
    end
  end
end
