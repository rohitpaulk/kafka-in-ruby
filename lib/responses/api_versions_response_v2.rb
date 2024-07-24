class Responses::ApiVersionsResponseV2 < Responses::BaseResponse
  attr_reader :error_code
  attr_reader :api_keys
  attr_reader :throttle_time_ms

  def initialize(correlation_id, error_code, api_keys, throttle_time_ms)
    super(correlation_id)
    @error_code = error_code
    @api_keys = api_keys
    @throttle_time_ms = throttle_time_ms
  end

  def ==(other)
    @error_code == other.error_code &&
      @api_keys == other.api_keys &&
      @throttle_time_ms == other.throttle_time_ms
  end

  def encode_body
    io = StringIO.new
    ProtocolWriter.write_int16(io, @error_code)

    ProtocolWriter.write_int32(io, @api_keys.length)

    @api_keys.each do |api_key|
      ProtocolWriter.write_int16(io, api_key[:api_key])
      ProtocolWriter.write_int16(io, api_key[:min_version])
      ProtocolWriter.write_int16(io, api_key[:max_version])
    end

    # TODO: See why this isn't required?
    ProtocolWriter.write_int32(io, @throttle_time_ms)

    io.string
  end

  def self.decode_body(correlation_id, bytes)
    io = StringIO.new(bytes)
    error_code = ProtocolReader.read_int16(io)
    puts "Error code: #{error_code}"
    api_keys_count = ProtocolReader.read_int32(io)
    puts "API keys count: #{api_keys_count}"

    api_keys = []

    (1..api_keys_count).each do
      puts "Reading once"
      api_key = ProtocolReader.read_int16(io)
      puts "API key: #{api_key}"
      min_version = ProtocolReader.read_int16(io)
      puts "Min version: #{min_version}"
      max_version = ProtocolReader.read_int16(io)
      puts "Max version: #{max_version}"

      api_keys << {api_key: api_key, min_version: min_version, max_version: max_version}
    end

    throttle_time_ms = ProtocolReader.read_int32(io)

    remaining_data = io.read
    raise "Expected EOF, got: #{remaining_data.inspect}" if remaining_data.length > 0

    new(correlation_id, error_code, api_keys, throttle_time_ms)
  end
end
