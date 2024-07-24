require_relative "test_helper"

class ApiVersionsRequestV2Test < Minitest::Test
  def test_encode
    request_header = RequestHeader.new(api_key: 18, api_version: 2, correlation_id: 1, client_id: 1)
    request = Requests::ApiVersionsRequestV2.new(header: request_header)
    assert_equal "\x00\x00\x00\x2A", request.encode
  end
end
