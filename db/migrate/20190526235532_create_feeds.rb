class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :feed
      t.date :parsed_at

      t.timestamps
    end
  end
end
