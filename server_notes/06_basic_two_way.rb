# UDP is simple, but it’s possible to layer more advanced features on top of it. For example, because there is no connection involved, you can alternate between client and server modes with a single program, accomplishing a two-way effect. You can demonstrate this easily by making a single program send and receive UDP data to and from itself:

require 'socket'

host = 'localhost'
port = 1234
s = UDPSocket.new
s.bind(nil, port)
s.send("1", 0, host, port)

5.times do 
  text, sender = s.recvfrom(16)
  remote_host = sender[3]

  puts "#{remote_host} sent #{text}"

  response = (text.to_i * 2).to_s 
  puts "We will respond with #{response}"

  s.send(response, 0, host, port)
end

# 127.0.0.1 sent 1
# We will respond with 2
# 127.0.0.1 sent 2
# We will respond with 4
# 127.0.0.1 sent 4
# We will respond with 8
# 127.0.0.1 sent 8
# We will respond with 16
# 127.0.0.1 sent 16
# We will respond with 32

# Note that in a real-world situation, you would typically have two scripts, each on a different machine and communicating between each other, but this example demonstrates the logic necessary to achieve that result on a single machine for ease of testing. UDP has some benefits in speed and the amount of resources needed, but because it lacks a state of connection and reliability in data transfer, TCP is more commonly used. 