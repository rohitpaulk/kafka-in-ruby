class RequestDecoders::ApiVersions
  def self.decode(header, body_bytes)
    Requests::ApiVersionsRequest.new(header: header) # No body to parse for ApiVersionsRequest
  end
end
