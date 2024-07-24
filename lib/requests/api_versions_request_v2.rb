class Requests::ApiVersionsRequestV2 < Requests::BaseRequest
  def handle
    Responses::ApiVersionsResponseV2.new(header.correlation_id, 0, [{api_key: 18, min_version: 0, max_version: 2}], 100)
  end

  def self.decode_body(header, body_bytes)
    Requests::ApiVersionsRequestV2.new(header: header) # No body to decode for ApiVersionsRequest
  end

  def encode_body
    "" # No body to encode for ApiVersionsRequestV2
  end
end
