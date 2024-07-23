class RequestHeader
  attr_reader :api_key, :api_version, :correlation_id, :client_id

  def initialize(api_key, api_version, correlation_id, client_id)
    @api_key = api_key
    @api_version = api_version
    @correlation_id = correlation_id
    @client_id = client_id
  end
end
