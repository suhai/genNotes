require 'socket'

s = UDPSocket.new
s.bind(nil, 1234)

5.times do 
  text, sender = s.recvfrom(16)
  puts text
end

# This above code uses Ruby’s socket library, a library that provides the lowest-level access to your operating system’s networking capabilities. socket is well suited for UDP, and in this example, you create a new UDP socket and bind it to port 1234 on the local machine. You loop five times, accepting data in 16-byte chunks from the socket and printing it to the screen. Note that the reason for looping just five times is so that the script can end gracefully after it receives five short messages.
