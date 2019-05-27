class Drip

  # Called each day from cron (then expand to hourly)
  def drip_to_aggregator
    feeds = Feed.where("parsed_at < ?", Date.today).all.pluck(:feed)
    Aggregator.new.bulk_queue feeds
  end

end
