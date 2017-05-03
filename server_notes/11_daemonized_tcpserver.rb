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

# daemonized_tcpserver.rb accepts a connection on port 1234, accepts lines of text returning "Received!" after each one, and then closes the connection if the word "quit" is used. Note that daemonized_tcpserver.rb has the same code as tcp_server.rb.

# When you run daemonized_tcpserver.rb on its own, it runs in the foreground, and you have to use Ctrl+C to stop it. If it ran as a daemon, however, it would run in the background and you’d be able to leave it running for as long as you like, and stop it at will at any point in the future. The daemons library lets us implement this feature quickly.

