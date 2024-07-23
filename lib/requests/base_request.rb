class Requests::BaseRequest
  attr_reader :header

  def initialize(header:)
    @header = header
  end
end
