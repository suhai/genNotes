require 'socket'

server = TCPServer.new(1234)

5.times do 
  fork do
    while connection = server.accept
      while line = connection.gets
        break if line =~ /quit/
        puts line
        connection.puts "Received!"
      end

      connection.puts "Closing the connection. Bye!"
      connection.close
    end
  end
end
# This code can be run from terminal, and then $ telnet 127.0.0.1 1234 can be used from multplie terminals or clients to interact with the server.
# Note that because the forked processes are continuing to run, to shut them down you need to kill them, such as with '$ killall ruby' (on Linux and OS X).

# The example above forks off five separate processes that can each accept connections in sequence, allowing five clients to connect to the server at the same time. Each of these processes runs separately from the main process, so even though the main process ends immediately after performing the forks, the client processes continue to run.

# Although you get the ability to run multiple, identical servers in parallel using forking, managing the child processes is clumsy. You have to kill them manually, and if any of them die or run into errors, they won’t be replaced with new servers. This means that if all the child processes die for whatever reason, you’re left with a nonoperational service!
# It’s possible to code all the logic and housekeeping necessary to maintain child processes yourself, but Ruby comes with a library called GServer that makes life a lot easier and works across all platforms.