require 'socket'

s = UDPSocket.new
s.send("hello", 0, 'localhost', 1234)

# The above code creates a UDP socket, but instead of listening for data, it sends the string 'hello' to the UDP server on localhost at port 1234. If you run basic_udpserver.rb at the same time as basic_udpclient.rb, “hello” should appear on the screen where  basic_udpserver.rb is running. You would have successfully sent data across a network (albeit on the same machine) from a client to a server using UDP.
# It is possible to run the client and server on different machines, and if you have multiple machines at your disposal, all you need to do is change 'localhost' on the send method to the hostname or IP address of the machine where basic_udpserver.rb is running.
# Note that 'localhost' refers to your local loopback network interface, but this can also sometimes be referred to using the IP addresses 127.0.0.1 and 0.0.0.0.