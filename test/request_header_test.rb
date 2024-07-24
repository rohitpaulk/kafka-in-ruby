require_relative "test_helper"

class RequestHeaderTest < Minitest::Test
  def test_encode_decode_with_client_id
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: "test")
    assert_equal request_header, RequestHeader.read(StringIO.new(request_header.encode))
  end

  def test_encode_decode_without_client_id
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: nil)
    assert_equal request_header, RequestHeader.read(StringIO.new(request_header.encode))
  end

  def test_encode_with_client_id
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: "test")

    # \x00\x12 = api_key
    # \x00\x02 = api_version
    # \x00\x00\x00\x01 = correlation_id
    # \x00\x04 = client_id length
    # test = client_id
    assert_equal "\x00\x12\x00\x02\x00\x00\x00\x01\x00\x04test", request_header.encode
  end

  def test_encode_without_client_id
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: nil)

    # \x00\x12 = api_key
    # \x00\x02 = api_version
    # \x00\x00\x00\x01 = correlation_id
    # \xFF\xFF = client_id length (-1)
    assert_equal "\x00\x12\x00\x02\x00\x00\x00\x01\xFF\xFF", request_header.encode
  end
end
