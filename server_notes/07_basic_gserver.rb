# GServer is a Ruby library that comes in the standard library and implements a “generic server” system. It features thread pool management, logging, and tools to manage multiple servers at the same time. GServer is offered as a class, and you produce server classes that inherit from it.
# Other than simple management, GServer also allows you to run multiple servers at once on different ports, allowing you to put together an entire suite of services in just a few lines of code. Threading is entirely handled by GServer, although you can get involved with the process if you like. GServer also implements logging features, although again, you can provide your own code for these functions if you wish.

# 1: The simplest TCP server possible with GServer:
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts('Hello!')
  end
end

server = HelloServer.new(1234)
server.start
server.join
# The above code implements a basic server that simply outputs the word “Hello!” to any client connecting to port 1234. If you telnet to connect to port 1234 (or even a web browser, using http://127.0.0.1:1234), you’ll see the string “Hello!” returned to you before the connection is closed.
# In this example, you create a server class called HelloServer that descends from GServer. GServer implements all the thread and connection management, leaving you with only a handful of technicalities to worry about. In this simple example, you only create a single server process, tell it to use port 1234, and start it immediately.
# However, even this simple example will work with multiple clients, and if you telnet to it multiple times in parallel, you’ll find that all requests are processed successfully.


# 2: Set a max number of allowed connections by supplying more parameters to new
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts('Say something to me:')
    line = io.gets
    io.puts("You said '#{line.chomp}'")
  end
end

server = HelloServer.new(1234, '127.0.0.1', 1)
server.start
server.join
# The 'new' method for GServer accepts several parameters. In order, they are the port number to run the server(s) on, the name of the host or interface to run the server(s) on, the maximum number of connections to allow at once (set to 1 in this example), a file handle of where to send logging messages, and a true or false flag to turn logging on or off.


# 3  Create multiple servers at once
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts('Say something to me:')
    line = io.gets
    io.puts("You said '#{line.chomp}'")
  end
end

server1 = HelloServer.new(1234, '127.0.0.1', 1)
server1.start
server2 = HelloServer.new(1235, '127.0.0.1', 5)
server2.start
sleep 20
# Creating multiple servers is as easy as creating a new instance of HelloServer(or any GServer descendent class), assigning it to a variable, and calling its start method.
# Another difference between this example and the last is that at the end you don’t call server.join. With GServer objects, join works in the same way as with Thread objects, where calling join waits for that thread to complete before continuing execution. In the first GServer examples, your programs would wait forever until you exited them manually (using Ctrl+C, for example). However, in the preceding example, you didn’t call any join methods, and only slept for 20 seconds using sleep 20. This means the servers you created are only available on ports 1234 and 1235 for 20 seconds after running the program, at which point the program and its child threads all exit at once.
# Because GServer allows multiple servers to run at the same time without impeding the execution of the main program, you can manage the currently running servers by using several methods GServer makes available to start, stop, and check servers:


# 4
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts("To stop this server, type 'shutdown'")
    self.stop if io.gets =~ /shutdown/
  end
end

server = HelloServer.new(1234)
server.start
loop do 
  break if server.stopped?
end
puts 'Server has been terminated'
# This time you put the main program into a loop waiting for the server to be stopped. The server is stopped if someone connects and types shutdown, which triggers that server’s stop method, leading to the whole server program ending.

# You can also check whether a GServer is running on a port without having the object reference available by using the in_service? class method:
if GServer.in_service?(1234)
  puts "Can't create new server. Already running!"
else
  server = HelloServer.new(1234)
end

