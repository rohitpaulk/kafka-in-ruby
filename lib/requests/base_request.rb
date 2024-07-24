class Requests::BaseRequest
  attr_reader :header

  def initialize(header:)
    @header = header
  end

  def encode
    io = StringIO.new
    message_bytes = header.encode + encode_body
    ProtocolWriter.write_int32(io, message_bytes.bytesize)
    io.write(message_bytes)
    io.string
  end
end
