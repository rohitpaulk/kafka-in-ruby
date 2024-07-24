class Responses::ApiVersionsResponseV2 < Responses::BaseResponse
  attr_reader :error_code, :api_keys, :throttle_time_ms

  def initialize(error_code, api_keys, throttle_time_ms)
    @error_code = error_code
    @api_keys = api_keys
    @throttle_time_ms = throttle_time_ms
  end

  def write(io)
    ProtocolWriter.write_int16(io, @error_code)

    ProtocolWriter.write_unsigned_varint(io, 0)
    # ProtocolWriter.write_unsigned_varint(io, @api_keys.length + 1)

    # @api_keys.each do |api_key|
    #   ProtocolWriter.write_int16(io, api_key[:api_key])
    #   ProtocolWriter.write_int16(io, api_key[:min_version])
    #   ProtocolWriter.write_int16(io, api_key[:max_version])
    # end

    ProtocolWriter.write_int32(io, @throttle_time_ms)
  end

  def self.decode_body(header, bytes)
    io = StringIO.new(bytes)
    error_code = ProtocolReader.read_int16(io)
    api_keys_count = ProtocolReader.read_int32(io)

    api_keys = []

    (1..api_keys_count).each do
      api_key = ProtocolReader.read_int16(io)
      min_version = ProtocolReader.read_int16(io)
      max_version = ProtocolReader.read_int16(io)

      api_keys << {api_key: api_key, min_version: min_version, max_version: max_version}
    end

    # TODO: Investigate why throttle_time_ms isn't included?
    # throttle_time_ms = ProtocolReader.read_int32(io)

    remaining_data = io.read
    raise "Expected EOF, got: #{remaining_data.inspect}" if remaining_data.length > 0

    new(error_code, api_keys, 0)
  end
end
