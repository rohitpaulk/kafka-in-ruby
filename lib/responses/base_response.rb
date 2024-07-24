class Responses::BaseResponse
  def self.read(io)
    message_length = ProtocolReader.read_int32(io)
    correlation_id = ProtocolReader.read_int32(io)
    message_bytes = io.read(message_length - 8)
    decode_body(correlation_id, message_bytes)
  end
end
