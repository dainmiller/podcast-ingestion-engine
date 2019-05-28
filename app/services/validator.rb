class Validator
  attr_accessor :validate, :xml

  def initialize fetcher
    @xml = fetcher.xml
    validate
  end

  def validate
    @doc = Nokogiri::XML @xml
  end

  def valid?
    if @doc.errors.any?
      false
    else
      true
    end
  end
end
