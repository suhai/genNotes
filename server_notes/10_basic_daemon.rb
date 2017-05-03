def daemonize
  fork do 
    Process.setsid
    exit if fork

    Dir.chdir('/')
    STDIN.reopen('dev/null')
    STDOUT.reopen('dev/null', 'a')
    STDERR.reopen('dev/null', 'a')
    trap("TERM") { exit }
    yield
  end
end

daemonize do 
  # you can do whatever you like in here and it will run in the background entirely separate from the parent process.
end
puts 'The daemon process has been launched'

# The daemonized method performs all the operations covered in the daemon processes list in netwworks.rb and then yields to a supplied code block. This means the code inside the code block following the daemonize call makes up the activity of the daemonized process. In here, you could create GServer servers, create threads, and do anything in Ruby that you like, independent of the shell or terminal with which you launched the initial program.
