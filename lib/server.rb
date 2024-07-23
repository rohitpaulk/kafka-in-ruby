require "socket"

class Server
  def initialize(port)
    @port = port
  end

  def self.start!(port:)
    new(port).start!
  end

  def start!
    server = TCPServer.new(@port)

    puts "Server started on port #{@port}"

    loop do
      client = server.accept
      puts "Accepted client"

      Thread.new do
        request = RequestReader.read(client)
        puts "Request: #{request.inspect}"

        response = request.handle
        puts "Response: #{response.inspect}"

        response_body_io = StringIO.new
        ProtocolWriter.write_int32(response_body_io, request.header.correlation_id)
        response.write(response_body_io)

        response_body_size = response_body_io.string.bytesize
        puts "Response body size: #{response_body_io.string.bytesize}"

        puts Hexdump.hexdump(response_body_io.string)

        ProtocolWriter.write_int32(client, response_body_size)
        client.write(response_body_io.string)
      end
    end
  end
end
