class Requests::BaseRequest
  attr_reader :header

  def initialize(header:)
    @header = header
  end

  def encode
    header_and_body = header.encode + encode_body
    [header.encode, encode_body].pack("C*")
  end
end
