class Validator
  attr_accessor :validate
  def initialize xml
    @xml = xml
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
