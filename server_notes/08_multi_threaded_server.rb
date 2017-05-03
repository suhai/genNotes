# Servers that accepts requests and immediately creates a new thread of execution to process the connection while allowing the main program to await more connections are commonly known as multithreaded servers.
# Ruby’s Thread class makes it easy to create a multithreaded server.

require 'socket'

server = TCPServer.new(1234)

loop do 
  Thread.start(server.accept) do |connection|
    while line = connection.gets
      break if line =~ /quit/
      puts line
      connection.puts "Received!"
    end
    
    connection.puts "Closing the connection. Bye!"
    connection.close
  end
end

# running this would get the server going. and then using $ telnet 127.0.0.1 1234 in different/multiple terminals, clients can interact with the server simultaneously.

# In the example above, you have a permanent loop, and when server.accept responds, a new thread is created and started immediately to handle the connection that has just been accepted, using the connection object passed into the thread. However, the main program immediately loops back and awaits new connections. Using Ruby threads in this way means the code is portable and will run in the same way on Linux, OS X, and Windows. However, threading is not without its disadvantages. 
# On POSIX-compliant operating systems (such as OS X and Linux, but not Windows)it is possible to fork a program so that a separate process is created, as opposed to a separate thread. However, rather than fork at the time of receiving a connection, you can fork a number of listening processes in advance to increase the maximum number of connections you can handle at once.