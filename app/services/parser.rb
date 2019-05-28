class Parser
  attr_accessor :parsed_feed

  def initialize validator
    parse validator.xml
  end

  def parse xml
    @parsed_feed = Feedjira::Feed.parse xml
  end

  def parsed?
    if @parsed_feed.entries.any?
      true
    else
      false
    end
  end
end
