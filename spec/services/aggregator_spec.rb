require 'rails_helper'

def feed_test_one
  'https://anchor.fm/s/783087c/podcast/rss'
end
def feed_test_two
  'http://atp.fm/episodes?format=rss'
end

RSpec.describe Aggregator, type: :model do

  describe "the ability to pass in & save feeds" do
    it "should be able to take in more than 1 feed at a time" do
      @aggregator = Aggregator.new
      @aggregator.bulk_queue(feeds: [feed_test_one, feed_test_two])
      expect(@aggregator.feed_count).to eq(2)
    end

    it "should be able to take in 1 feed at a time" do
      @aggregator = Aggregator.new
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.feed_count).to eq(1)
    end

    it "should validate the feed passed in" do
      @aggregator = Aggregator.new
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.validator.respond_to?(:validate)).to eq(true)
      expect(@aggregator.validator.valid?).to eq(true)
    end

    it "should parse the feed passed in" do
      @aggregator = Aggregator.new
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.parser.respond_to?(:parse)).to eq(true)
      expect(@aggregator.parser.parsed?).to eq(true)
    end

    it "should save the <channel> (xml terminology) attributes as a show object" do
    end

    it "should save the <item> (xml terminology) as episode objects" do
    end
  end
end


