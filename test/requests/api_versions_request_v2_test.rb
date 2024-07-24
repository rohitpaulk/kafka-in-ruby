require_relative "../test_helper"

class ApiVersionsRequestV2Test < Minitest::Test
  def test_encode
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: nil)
    request = Requests::ApiVersionsRequestV2.new(header: request_header)

    # \x00\x00\x00\x0A = body length (10)
    # \x00\x12 = api_key
    # \x00\x02 = api_version
    # \x00\x00\x00\x01 = correlation_id
    # \xFF\xFF = client_id length (-1)
    assert_equal format_as_hex("\x00\x00\x00\x0A\x00\x12\x00\x02\x00\x00\x00\x01\xFF\xFF"), format_as_hex(request.encode)
  end

  def test_kafka_bytes
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: nil)
    request = Requests::ApiVersionsRequestV2.new(header: request_header)

    socket = TCPSocket.new("localhost", 9092)
    socket.write(request.encode)
    response = Responses::ApiVersionsResponseV2.read(socket)
    assert_equal 0, response.error_code
    assert_equal 57, response.api_keys.count
    assert_equal 0, response.api_keys.first[:api_key]
    assert_equal 0, response.api_keys.first[:min_version]
    assert_equal 10, response.api_keys.first[:max_version]
  end

  def format_as_hex(bytes)
    bytes.unpack1("H*").chars.each_slice(2).map(&:join).join(" ")
  end
end
