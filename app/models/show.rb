class Show < ApplicationRecord
  belongs_to :network, optional: true
  belongs_to :category, optional: true
  has_many :episodes

  def self.save_show_from(parsed_feed:, category: category)
    instance = self.find_or_create_by! title: parsed_feed.title
    instance.update!(
      category: category,
      description: parsed_feed.description
    )
    return instance
  end

  def save_episodes_from(feed_entries:)
    feed_entries.each do |entry|
      episode = self.episodes.find_or_create_by!(title: entry.title)

      episode.update!(
        description: entry.summary,
        streaming_url: entry.enclosure_url,
        guid: entry.entry_id
      )
    end
  end

end
