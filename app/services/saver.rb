class Saver

  def initialize parser
    save parser.parsed_feed
  end

  def save parsed_feed
    @show = ShowSaver.save parsed_feed
    EpisodeSaver.save parsed_feed.entries, @show
  end

  def saved?
    @show.valid?
  end

end
