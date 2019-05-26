class Validator
  attr_accessor :validate
  def initialize feed
    @feed = feed
    @xml  = HTTParty.get(@feed, headers: {
      'User-Agent': 'HTTParty',
      'Content-Type': 'application/xml'
    }).body
    validate
  end

  def validate
    @doc = Nokogiri::XML(@xml)
  end

  def valid?
    if @doc.errors.any?
      false
    else
      true
    end
  end
end
