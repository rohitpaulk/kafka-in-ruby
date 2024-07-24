class Responses::ApiVersionsResponseV2
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
end
