class EpisodeSaver

  def self.save entries, show
    show.save_episodes_from(feed_entries: entries)
  end

  def saved?
    # TODO: Implement this method
  end
end
