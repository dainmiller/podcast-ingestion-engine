require 'rails_helper'

def feed_test_one
  'https://anchor.fm/s/783087c/podcast/rss'
end
def feed_test_two
  'http://atp.fm/episodes?format=rss'
end

RSpec.describe Aggregator, type: :model do

  describe "the ability to pass in & save feeds" do
    before(:each) {
      @aggregator = Aggregator.new
    }

    it "should be able to take in more than 1 feed at a time" do
      @aggregator.bulk_queue(feeds: [feed_test_one, feed_test_two])
      expect(@aggregator.feed_count).to eq(2)
    end

    it "should be able to take in 1 feed at a time" do
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.feed_count).to eq(1)
    end

    it "should validate the feed passed in" do
      @aggregator.queue(feed: [feed_test_two])
      expect(@aggregator.validator.respond_to?(:validate)).to eq(true)
      expect(@aggregator.validator.valid?).to eq(true)
    end

    it "should not move onto parse step if not valid" do
      @aggregator.queue(feed: ["http://google.com"])
      expect(@aggregator.validator.valid?).to eq(false)
      expect(@aggregator.parser).to be_nil
    end

    it "should parse the feed passed in" do
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.parser.respond_to?(:parse)).to eq(true)
      expect(@aggregator.parser.parsed?).to eq(true)
    end

    it "should save the feed passed in" do
      @aggregator.queue(feed: [feed_test_one])
      expect(@aggregator.saver.respond_to?(:save)).to eq(true)
      expect(@aggregator.saver.saved?).to eq(true)
    end

  end
end


