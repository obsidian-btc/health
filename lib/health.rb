class Health
  attr_reader :port_number
  attr_reader :check

  def self.build port_number, &block
    instance = new port_number, &block
  end

  def initialize port_number, &block
    @port_number = port_number
    @check = block
  end

  def start!
    Thread.new {
      require 'socket'
      require 'json'

      server = TCPServer.new('localhost', port_number)
      @start_time = Time.now

      loop do
        socket = server.accept

        request = socket.gets

        response_hash = {uptime: Time.now - @start_time}
        response_hash.merge! check.call if check
        response = JSON.pretty_generate(response_hash)

        socket.print "http/1.1 200 ok\r\n" +
          "content-type: application/json\r\n" +
          "content-length: #{response.bytesize}\r\n" +
        "connection: close\r\n"

        socket.print "\r\n"

        socket.print response

        socket.close
      end
    }
  end
end

