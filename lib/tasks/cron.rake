# Runs every 1 day (at first)
task :pull_feeds_and_pass_to_aggregator => :environment do
  @aggregator = Aggregator.new
  Feed.where("parsed_at < ?", Date.today).pluck(:feed).each do |feed|
    @aggregator.queue(feed)
  end
end
