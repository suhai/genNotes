# With the knowledge picked up so far and a small jump in complexity, one can build a practical application (using GServer) such as a simple chat server that allows a number of clients to connect and chat among each other.
# The first step is to subclass GServer into a new class, ChatServer, and override the new method with your own so that you can set up class variables to store client IDs and the chat log for all the clients to share:

# Note Remember that you can specify the hostname to serve from as the second parameter to ChatServer.new. If you want to use this chat server over the Internet, you might need to specify your remotely accessible IP address as this second parameter, otherwise your server might only be available to machines on your local network.

require 'gserver'

class ChatServer < GServer 
  def initialize(*args)
    super(*args)
    # keep an overall record of the client IDs allocated and the lines of chat
    @@client_id = 0
    @@chat = []
  end

  def serve(io)
    # increment the client ID so each gets a unique ID 
    @@client_id += 1
    my_client_id = @@client_id
    my_position = @@chat.size

    io.puts("Welcome to the chat, client #{@@client_id}!")
    # Leave a message on the chat queue to signify this client has joined chat
    @@chat << [my_client_id, "<joins the chat>"]

    loop do
      # Every 5 seconds check to see if we are receiving any data
      if IO.select([io], nil, nil, 2)
        # if so, then retrieve the data and process it ...
        line = io.gets

        # if the user says 'quit', then disconnect them
        if line =~ /quit/
          @@chat << [my_client_id, "<leaves the chat>"]
          break
        end
      
        # shutdown the server if we hear 'shutdown'
        self.stop if line =~ /shutdown/

        # Add the client's text to the chat array along with the client's ID
        @@chat << [my_client_id, line]
      else
        # No data, so print any new lines from the chat stream
        @@chat[my_position..-1].each do |param|
          io.puts("#{param[0]} says: #{param[1]}")
        end
        
        # Move the position to one pst the end of the array
        my_position = @@chat.size
      end
    end
    
  end 
end

server = ChatServer.new(1234)
server.start

loop do 
  break if server.stopped?
end 


# With the basic GServer principles, you can create servers that operate to protocols of your own design, or even create server programs that can respond to preexisting protocols. All it requires is being able to receive data, process it, and send back the data required by the client. Using these techniques, it’s possible to create a mail server, web server, or any other type of server necessary online.