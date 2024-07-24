class Responses::BaseResponse
  attr_reader :correlation_id

  def initialize(correlation_id)
    @correlation_id = correlation_id
  end

  def encode
    io = StringIO.new
    body_bytes = encode_body
    ProtocolWriter.write_int32(io, body_bytes.bytesize + 4)
    ProtocolWriter.write_int32(io, correlation_id)
    io.write(body_bytes)
    io.string
  end

  def self.read(io)
    message_length = ProtocolReader.read_int32(io)
    correlation_id = ProtocolReader.read_int32(io)
    message_bytes = io.read(message_length - 8)
    decode_body(correlation_id, message_bytes)
  end
end
