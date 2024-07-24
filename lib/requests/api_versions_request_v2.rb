class Requests::ApiVersionsRequestV2 < Requests::BaseRequest
  def handle
    Responses::ApiVersionsResponseV2.new(
      header.correlation_id,
      0, [
        {
          ApiKey: 0,
          MinVersion: 0,
          MaxVersion: 10
        },
        {
          ApiKey: 1,
          MinVersion: 0,
          MaxVersion: 16
        },
        {
          ApiKey: 2,
          MinVersion: 0,
          MaxVersion: 8
        },
        {
          ApiKey: 3,
          MinVersion: 0,
          MaxVersion: 12
        },
        {
          ApiKey: 8,
          MinVersion: 0,
          MaxVersion: 9
        },
        {
          ApiKey: 9,
          MinVersion: 0,
          MaxVersion: 9
        },
        {
          ApiKey: 10,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 11,
          MinVersion: 0,
          MaxVersion: 9
        },
        {
          ApiKey: 12,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 13,
          MinVersion: 0,
          MaxVersion: 5
        },
        {
          ApiKey: 14,
          MinVersion: 0,
          MaxVersion: 5
        },
        {
          ApiKey: 15,
          MinVersion: 0,
          MaxVersion: 5
        },
        {
          ApiKey: 16,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 17,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 18,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 19,
          MinVersion: 0,
          MaxVersion: 7
        },
        {
          ApiKey: 20,
          MinVersion: 0,
          MaxVersion: 6
        },
        {
          ApiKey: 21,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 22,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 23,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 24,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 25,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 26,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 27,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 28,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 29,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 30,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 31,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 32,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 33,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 34,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 35,
          MinVersion: 0,
          MaxVersion: 4
        },
        {
          ApiKey: 36,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 37,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 38,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 39,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 40,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 41,
          MinVersion: 0,
          MaxVersion: 3
        },
        {
          ApiKey: 42,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 43,
          MinVersion: 0,
          MaxVersion: 2
        },
        {
          ApiKey: 44,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 45,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 46,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 47,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 48,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 49,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 50,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 51,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 55,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 57,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 60,
          MinVersion: 0,
          MaxVersion: 1
        },
        {
          ApiKey: 61,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 64,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 65,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 66,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 68,
          MinVersion: 0,
          MaxVersion: 0
        },
        {
          ApiKey: 74,
          MinVersion: 0,
          MaxVersion: 0
        }
      ],
      100
    )
  end

  def self.decode_body(header, body_bytes)
    Requests::ApiVersionsRequestV2.new(header: header) # No body to decode for ApiVersionsRequest
  end

  def encode_body
    "" # No body to encode for ApiVersionsRequestV2
  end
end
