class ShowSaver

  def self.save parsed_feed
    category = Category.save_from parsed_feed
    show     = Show.save_show_from(parsed_feed: parsed_feed, category: category)
    return show
  end

end
