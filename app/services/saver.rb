class Saver

  def initialize parser
    @parser = parser
    save
  end

  def save
    @show = Show.find_or_create_by!(title: @parser.parsed_feed.title)

    @parser.parsed_feed.entries.each do |entry|
      @show.episodes.find_or_create_by!(
        title: entry.title,
        description: entry.summary,
        streaming_url: entry.enclosure_url
      )
    end
  end

  def saved?
    @show.valid?
  end
end
