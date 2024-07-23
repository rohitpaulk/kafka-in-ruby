class Requests::ApiVersionsRequest < Requests::BaseRequest
  def handle
    Responses::ApiVersionsResponse.new(0, [{api_key: 18, min_version: 0, max_version: 2}], 100)
  end
end
