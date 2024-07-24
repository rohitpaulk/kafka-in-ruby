class RequestHeader
  attr_reader :api_key, :api_version, :correlation_id, :client_id

  def initialize(api_key:, api_version:, correlation_id:, client_id:)
    @api_key = api_key
    @api_version = api_version
    @correlation_id = correlation_id
    @client_id = client_id
  end

  def self.read(io)
    api_key = ProtocolReader.read_int16(io)
    api_version = ProtocolReader.read_int16(io)
    correlation_id = ProtocolReader.read_int32(io)
    client_id = ProtocolReader.read_nullable_string(io)

    RequestHeader.new(api_key:, api_version:, correlation_id:, client_id:)
  end

  def encode
    io = StringIO.new
    ProtocolWriter.write_int16(io, api_key)
    ProtocolWriter.write_int16(io, api_version)
    ProtocolWriter.write_int32(io, correlation_id)
    ProtocolWriter.write_nullable_string(io, client_id)

    io.string
  end

  def ==(other)
    api_key == other.api_key &&
      api_version == other.api_version &&
      correlation_id == other.correlation_id &&
      client_id == other.client_id
  end
end
