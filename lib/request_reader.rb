require "stringio"

class RequestReader
  def self.read(io)
    message_length = ProtocolReader.read_int32(io)
    puts "Request message length: #{message_length}"

    message_bytes = io.read(message_length)
    puts Hexdump.hexdump(message_bytes)

    message_io = StringIO.new(message_bytes)
    request_header = read_header(message_io)

    request_decoder_class = case request_header.api_key
    when 18
      RequestDecoders::ApiVersions
    else
      raise "Unknown API key: #{api_key}"
    end

    request_decoder_class.decode(request_header, message_io.read)
  end

  def self.read_header(io)
    api_key = ProtocolReader.read_int16(io)
    api_version = ProtocolReader.read_int16(io)
    correlation_id = ProtocolReader.read_int32(io)
    client_id = ProtocolReader.read_nullable_string(io)

    RequestHeader.new(api_key, api_version, correlation_id, client_id)
  end
end
