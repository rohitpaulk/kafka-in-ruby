class Requests::ApiVersionsRequest
  def handle
    Responses::ApiVersionsResponse.new(0, [{api_key: 1, min_version: 0, max_version: 1}], 0)
  end
end
