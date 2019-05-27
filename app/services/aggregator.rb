class Aggregator

  attr_accessor :validator, :parser, :saver

  def initialize ; end

  def queue(feed:)
    raise_if_not_array_type feed
    bulk_queue feeds: feed
  end

  def bulk_queue(feeds:)
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
    xml = HTTParty.get(feed, headers: {
      'User-Agent': 'HTTParty',
      'Content-Type': 'application/xml'
    }).body

    # TODO: Setting up for future refactor using functional #.inject
    # TODO: The parser should take a validator object
    # TODO: I could add an additional step that encapsolates the fetch (HTTParty), then..
    # TODO: The validator should take a fetcher object
    [Validator, Parser, Saver].each do |klass|
      @validator  = klass.new(xml)      if klass.eql? Validator
      @parser     = klass.new(xml)      if klass.eql? Parser  and @validator.valid?
      @saver      = klass.new(@parser)  if klass.eql? Saver   and @validator.valid? and @parser.parsed?
    end
  end

  def raise_if_not_array_type input
    raise "Pass in feed(s) as an array" if !input.is_a? Array
  end
end
