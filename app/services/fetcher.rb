class Fetcher
  attr_accessor :xml

  def initialize feed
    fetch feed
  end

  def fetch feed
    begin
      @xml = HTTParty.get(feed, headers: {
        'User-Agent': 'StitcherX',
        'Content-Type': 'application/xml'
      }).body
    rescue
      @xml = nil
    end
  end

  def fetched?
    not fetch_error?
  end

  def fetch_error?
    @xml.nil?
  end
end
