# TCP servers are the foundation of most Internet services. Although lightweight time servers and DNS servers can survive with UDP, when sending web pages and e-mails around, it’s necessary to build up a connection with a remote server to make the requests and send and receive data.
require 'socket'

server = TCPServer.new(1234)
while connection = server.accept
  while line = connection.gets
    break if line =~ /quit/
    puts line
    connection.puts "Received!"
  end

  connection.puts "Closing the connection. Bye!"
  connection.close
end

# running this file from one terminal and then going to a new terminal to run:
# $ telnet 127.0.0.1 1234
# Trying 127.0.0.1...
# Connected to localhost.
# Escape character is '^]'.
# $ Hello!
# Received!
# $ how are you?
# Received!
# $ quit
# Closing the connection. Bye!
# Connection closed by foreign host.

# Alternatively, you can create your own basic client. An example is basic_tcp_client.rb, which can be run simultaneously with this file.

# The above code is a basic server that operates on port 1234, accepts connections, prints any text sent to it from a client, and sends back an acknowledgment. Note that this server will go around the main loop permanently. press Ctrl+C to exit.

# As with the UDP client and server example, the client and server applications can (and usually would) be placed on different machines. These test applications would work in exactly the same way if the server were located on the other side of the world and the client were run- ning from your local machine, as long as both machines were connected to the Internet.
# However, one downside to your TCP server is that it can only accept one connection at
# a time. If you telnet to it once and begin typing, but then another connection is attempted, it might begin to connect, but no responses will be forthcoming for anything sent. The reason for this is that your TCP server can work with only one connection at a time in its current state.