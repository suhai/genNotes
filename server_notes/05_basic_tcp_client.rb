require 'net/telnet'

server = Net::Telnet::new('Host' => '127.0.0.1',
'Port' => 1234,
'Telnetmode' => false)
lines_to_send = ['Hello!', 'This is a test', 'quit']
lines_to_send.each do |line|
  server.puts(line)

  server.waitfor(/./) do |data|
    puts data
  end
end

# The code above is to be run with the basic_tcp_server.rb file.

# Note that as with the UDP client and server example, the client and server applications can (and usually would) be placed on different machines. These test applications would work in exactly the same way if the server were located on the other side of the world and the client were run- ning from your local machine, as long as both machines were connected to the Internet.
# However, one downside to your TCP server is that it can only accept one connection at
# a time. If you telnet to it once and begin typing, but then another connection is attempted, it might begin to connect, but no responses will be forthcoming for anything sent. The reason for this is that your TCP server can work with only one connection at a time in its current state.