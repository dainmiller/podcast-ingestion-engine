class Saver

  def initialize parser
    @parser = parser
    save
  end

  def save
    @category = Category.save_from(@parser.parsed_feed)
    @show     = Show.save_from(@parser.parsed_feed)

    @show.update!(
      category: @category,
      description: @parser.parsed_feed.description
    )

    @parser.parsed_feed.entries.each do |entry|

      episode = @show.episodes.find_or_create_by!(title: entry.title)

      episode.update!(
        description: entry.summary,
        streaming_url: entry.enclosure_url,
        guid: entry.entry_id
      )

    end
  end

  def saved?
    @show.valid?
  end
end
