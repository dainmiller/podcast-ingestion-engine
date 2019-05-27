class Validator
  attr_accessor :validate

  def initialize xml
    validate xml
  end

  def validate xml
    @doc = Nokogiri::XML xml
  end

  def valid?
    if @doc.errors.any?
      false
    else
      true
    end
  end
end
