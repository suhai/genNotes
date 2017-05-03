require 'rubygems'
require 'daemons'

Daemons.run('daemonized_tcpserver.rb')

# Other than getting the daemons library loaded, the only thing that happens is that the run method of the Daemons class is called with the filename of the TCP server program as an argument. This is all you need to do to create a basic daemon! Run daemonized_tcpserver_control.rb and see what happens:

#   ERROR: no command given

# Usage: daemonized_tcpserver.rb <command> <options> -- <application options>

# * where <command> is one of:
#   start         start an instance of the application
#   stop          stop all instances of the application
#   restart       stop all instances and restart them afterwards
#   run           start the application and stay on top
#   zap           set the application to a stopped state

# * and where <options> may contain several of the following:

#     -t, --ontop                      Stay on top (does not daemonize)
#     -f, --force                      Force operation

# Common options:
#     -h, --help                       Show this message
#         --version                    Show version

# With no command-line arguments, the daemons library doesn’t know what to do, so it shows its help page. It shows that you can use commands like start, stop, and restart to start, stop, and restart the daemon, respectively, with the daemons library managing everything behind the scenes. You can also use the run, -t, or --ontop options to run the server app in the usual non-daemonized way.

# Run daemonized_tcpserver_control with the 'start' option to start the TCP server as a daemonized process (for example, ruby daemonized_tcpserver_control start). You should be returned straight to the command prompt, yet you can still telnet to localhost on port 1234 and interact with the TCP server in daemonized_tcpserver.rb. Likewise, when you want to stop the server, run daemonized_tcpserver_control with the 'stop' option.
# The daemons library can also be used in a simpler fashion. In the “Basic Daemon Creation” section, we created a method called daemonize that would daemonize the current process and execute a code block. The daemons library’s Daemons class provides a method called daemonize that does something similar, just without the code block. You just call the Daemons.daemonize method and the currently running process is daemonized on the spot. You don’t get any cool start, stop, or restart functionality, though, so its utility is limited.
