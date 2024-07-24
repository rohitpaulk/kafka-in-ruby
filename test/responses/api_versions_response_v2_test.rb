require_relative "../test_helper"

class ApiVersionsResponseV2Test < Minitest::Test
  def test_encode
    response = Responses::ApiVersionsResponseV2.new(0, 0, [{api_key: 0, min_version: 0, max_version: 10}], 0)

    # \x00\x00\x00\x10 - Message Length (16 bytes)
    # \x00\x00\x00\x00 - Correlation ID (4 bytes)
    # \x00\x00 - Error Code (2 bytes)
    # \x00\x01\x00\x01 - Length of API Keys (4 bytes)
    # - \x00\x00 (API Key)
    # - \x00\x00 (Min Version)
    # - \x00\x0A (Max Version)
    assert_equal format_as_hex("\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x0A"), format_as_hex(response.encode)
  end

  def test_encode_decode
    response = Responses::ApiVersionsResponseV2.new(1, 0, [{api_key: 1, min_version: 0, max_version: 10}], 0)
    io = StringIO.new(response.encode)
    puts Hexdump.hexdump(io.string)
    decoded_response = Responses::ApiVersionsResponseV2.read(io)
    assert_equal response, decoded_response
  end

  def format_as_hex(bytes)
    bytes.unpack1("H*").chars.each_slice(2).map(&:join).join(" ")
  end
end
