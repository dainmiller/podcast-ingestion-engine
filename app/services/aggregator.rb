class Aggregator

  attr_accessor :fetcher, :validator, :parser, :saver

  def initialize ; end

  # TODO: Reverse this delegation
  # .bulk_queue should delegate to queue
  def queue(feed:)
    raise_if_not_array_type feed
    bulk_queue feeds: feed
  end

  def bulk_queue(feeds:)
    raise_if_not_array_type feeds
    @feeds = feeds
    @feeds.each do |feed|
      run! feed
    end
  end

  def feed_count
    @feeds.count
  end

  private
  def run! feed
    [Fetcher, Validator, Parser, Saver].each do |klass|
      @fetcher    = klass.new(feed)       if klass.eql? Fetcher
      @validator  = klass.new(@fetcher)   if klass.eql? Validator and fetched?
      @parser     = klass.new(@validator) if klass.eql? Parser    and fetched? and valid?
      @saver      = klass.new(@parser)    if klass.eql? Saver     and fetched? and valid? and parsed?
    end
  end

  def raise_if_not_array_type input
    raise "Pass in feed(s) as an array" if !input.is_a? Array
  end
  def fetched?
    @fetcher.fetched?
  end
  def valid?
    @validator.valid?
  end
  def parsed?
    @parser.parsed?
  end
end


