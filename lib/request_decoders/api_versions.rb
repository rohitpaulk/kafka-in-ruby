class RequestDecoders::ApiVersions
  def self.decode(header, body_bytes)
    Requests::ApiVersionsRequest.new
  end
end
