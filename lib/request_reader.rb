require "stringio"

class RequestReader
  def self.read(io)
    message_length = ProtocolReader.read_int32(io)
    puts "Request message length: #{message_length}"

    message_bytes = io.read(message_length)
    puts Hexdump.hexdump(message_bytes)

    message_io = StringIO.new(message_bytes)
    request_header = RequestHeader.read(message_io)

    request_class = case request_header.api_key
    when 18
      case request_header.api_version
      when 2
        Requests::ApiVersionsRequestV2
      else
        raise "Unknown API version: #{request_header.api_version}"
      end
    else
      raise "Unknown API key: #{api_key}"
    end

    request_class.decode(request_header, message_io.read)
  end
end
