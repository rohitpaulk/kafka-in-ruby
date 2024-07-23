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
        # TODO: Loop
        request = RequestReader.read(client)
        puts "Request: #{request.inspect}"
        response = request.handle
        puts "Response: #{response.inspect}"
        response.write(client)
      end
    end
  end
end
