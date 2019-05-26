class Aggregator

  attr_accessor :validator, :parser

  def initialize ; end

  def queue(feed:)
    raise_if_not_array_type feed
    bulk_queue feeds: feed
  end

  def bulk_queue(feeds:i)
    raise_if_not_array_type feeds
    @feeds = feeds
    feeds.each do |feed|
      run! feed
    end
  end

  def feed_count
    @feeds.count
  end

  private
  def run! feed
    [Validator, Parser, Saver].each do |klass|
      @validator  = klass.new(feed) if klass.eql? Validator
      @parser     = klass.new(feed) if klass.eql? Parser
      @saver      = klass.new(feed) if klass.eql? Saver
    end
  end

  def raise_if_not_array_type input
    raise "Pass in feed(s) as an array" if !input.is_a? Array
  end
end
