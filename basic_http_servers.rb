puts 'CREATING BASIC HTTP SERVERS USING WEBRICK'
# For yet to be determined reasons, I am only able to run these scripts by running this file from the command line using ruby. Attempts to run them from pry havent been successful yet.

# 1. A simple local server may be set up with a scode such as:
require 'webrick'

server = WEBrick::GenericServer.new( :Port => 1234 )
trap("INT") { server.shutdown }
server.start do |socket|
  socket.puts Time.now
end

# After running the above code, you could try to view the results in your web browser by visiting 'http://127.0.0.1:1234/' or 'http://localhost:1234/'.
# Note that because your test program doesn’t output valid HTTP, it might fail with some particularly sensitive web browsers. However, if you understand how to use the telnet program, you can use 'telnet 127.0.0.1 1234/' to see the result. Otherwise, continue to the next example, where valid HTTP is returned for web browsers to view.


# 2. A more powerful technique is when you create servlets that exist in their own class and have more control over the requests and responses made to them:
require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response.content_type = 'text/plain'
    response.body = "Hello world! #{Time.now}"
    # response.body = "You are trying to load #{request.path}"
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
server.mount "/", MyServlet
trap("INT") { server.shutdown }
server.start

# running '$ ruby <file_name>' in the terminal would activate thge server and get it running. Results can be viewed by visiting urls such as:
# http://localhost:1234     This outputs 'Hello world! +time' browser window.
# http://127.0.0.1:1234     same as above
# http://localhost:1234     This outputs 'Hello world! +newtime' browser window.
# http://localhost:1234/abcd     This outputs "You are trying to load abcd" if the second response.body is used instead.


# 3. An even more elaborate example is:
require 'webrick'

class MyNormalClass
  def MyNormalClass.add(a, b)
    a.to_i + b.to_i
  end

  def MyNormalClass.subtract(a, b)
    a.to_i - b.to_i
  end  
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)

    if request.query['a'] && request.query['b']
      a = request.query['a']
      b = request.query['b']
      response.status = 200
      response.content_type = 'text/plain'
      result = nil

      case request.path
      when '/add'
        result = MyNormalClass.add(a, b)
      when '/subtract'
        result = MyNormalClass.subtract(a, b)
      else
        result = 'No such method'
      end

      response.body = result.to_s + "\n"
    else
      response.status = 400
      response.body = 'You did not provide the correct parameters'
    end
    
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
server.mount '/', MyServlet
trap('INT') { server.shutdown}
server.start

# running '$ ruby <file_name>' in the terminal would activate thge server and get it running. Results can be viewed by visiting urls such as:
# http://localhost:1234/add?a=10&b=20     This outputs 30 in the browser window.
# http://127.0.0.1:1234/add?a=10&b=20     same as above
# http://localhost:1234/subtract?a=100&b=20  outpts 80 in the browser window


puts 'CREATING HTTP SERVERS USING MONGREL'
require 'rubygems'
require 'mongrel'

class BasicServer < Mongrel::HttpHandler
  def process(request, response)
    response.start(200) do |headers, output|
      headers["content-Type"] = 'text/html'
      output.write('<html><body><h1>Hey, whats up Hello!</h1></body></html>')
    end
  end
end

s = Mongrel::HttpServer.new("0.0.0.0", "1234")
# s = Mongrel::HttpServer.new("0.0.0.0", "1234", 20)
s.register("/", BasicServer.new)
s.run.join
# running '$ ruby <file_name>' in the terminal would activate thge server and get it running. Results can be viewed by visiting urls such as:
# http://localhost:1234       would output 'Hey whats up Hello!'
# Note that this works in pry as well as running the script file with ruby

# Note that Mongrel::HttpServer.new can also take an optional third argument that specifies the number of threads to open to handle requests. For example:
# s = Mongrel::HttpServer.new("0.0.0.0", "1234", 20)
# The above line creates 20 processor threads that handle requests.
# Also note that Mongrel is reasonably similar to WEBrick, but with some extra benefits. You can learn more by visiting mongrel's site.


puts 'Remote Procedure Calls'
# A common way to make program functionality available to remote programs is with Remote Procedure Calls (RPCs). In contrast to allowing control via a web browser, RPC is designed for situations where one program gets to use the methods and procedures made available by another. When used correctly, using the methods and procedures made available by remotely located programs can feel almost as easy as using local methods and procedures.
# Ruby has built-in support for two of the most popular RPC protocols, XML-RPC and SOAP, as well as a special system of its own called DRb.

# XML-RPC
# XML-RPC is a well-known RPC protocol that uses XML for its messaging and HTTP for its transport. One of the benefits of RPC is that you can create multiple programs in different languages, but still talk between them in a way that every language understands. It makes it possible to write a system in, say, PHP or Python, but call the methods made available by that program with Ruby.
# Calling an XML-RPC–Enabled Method
require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://xmlrpc-c.sourceforge.net/api/sample.php")
puts server.call("sample.sumAndDifference", 5, 3) # {"sum"=>8, "difference"=>2}
# Note that this output is obtained when the file is run, or when entered in pry. There is no need to go to the browser becasue you are basically calling the remote server with the above command. More about xmlrpc can be found at:
# https://github.com/sj26/ruby-1.9.3-p0/blob/master/lib/xmlrpc/README.rdoc

# This example uses a remote application (written in PHP) that makes available a method called sample.sumAndDifference. First, you create a handle that refers to the remote program using XMLRPC::Client.new2, and then you call the method with two parameters. The results (the sum and the difference of your two arguments) come back in a hash.
# Because dealing with remote programs can lead to errors (bad connections, remote ser- vice is unavailable, and so on), it makes sense to process errors that come back from RPC calls. XML-RPC offers a call2 method that makes this easy:
require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://xmlrpc-c.sourceforge.net/api/sample.php")
ok, results = server.call2("sample.sumAndDifference", 5, 3)

if ok
  puts results.inspect
else
  puts results.faultCode
  puts results.faultSring
end
# call2 returns an array containing a “success” flag and the results. You can check to see if the first element of the array (the “success” flag) is true, but if not, you can investigate the error.

# puts 'How to make your own XML-RPC–Enabled Program'
require 'xmlrpc/server'

server = XMLRPC::Server.new(1234)
server.add_handler("sample.sumAndDifference") do |a,b|
  { "sum" => a.to_i + b.to_i, "difference" => a.to_i - b.to_i }
end
trap("INT") { server.shutdown }
server.serve

# To have a CGI-based XML-RPC server? Just replace XMLRPC::Server.new(1234) with XMLRPC::CGIServer.new
# I am currently getting:
# Method Not Allowed
# unsupported method `GET'.

# require 'xmlrpc/server'

# server = XMLRPC::CGIServer.new
# server.add_handler("sample.sumAndDifference") do |a,b|
#   { "sum" => a.to_i + b.to_i, "difference" => a.to_i - b.to_i }
# end
# trap("INT") { server.shutdown }
# server.serve