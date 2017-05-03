puts 'RUBY AND THE INTERNET' 
# HyperText Transfer Protocol (HTTP) is an Internet protocol that defines how web servers and web clients (such as web browsers) communicate with each other. The basic principle of HTTP, and the Web in general, is that every resource (such as a web page) available on the Web has a distinct Uniform Resource Locator (URL), and that web clients can use HTTP verbs such as GET, POST, PUT, and DELETE to retrieve or otherwise manipulate those resources. For example, when a web browser retrieves a web page, a GET request is made to the correct web server for that page, which then returns the contents of the web page.

# HTTPS: A secure version of HTTP that ensures data being transferred in either direction is only readable at each end. Anyone intercepting an HTTPS stream cannot decipher it. It’s commonly used for e-commerce and for transmitting financial data on the Web.
# HTML (HyperText Markup Language): A text formatting and layout language used to represent web pages.
# Markaby: A Ruby library that makes it possible to produce HTML directly from Ruby methods and logic.
# RedCloth: A Ruby implementation of the Textile markup language that makes it easy to produce HTML documents from specially formatted plain text.
# Hpricot: A self-proclaimed “fast and delightful” HTML parser developed to make it easy to process and parse HTML with Ruby. It is noted for its speed, with portions that demand extra performance written in C.
# POP3 (Post Office Protocol 3): A mail server protocol commonly used when retrieving e-mail.                                    .
# SMTP (Simple Mail Transfer Protocol): A mail server protocol commonly used to transfer mail to a mail server or between mail servers. From a typical user’s perspective, SMTP is used for sending mail, rather than receiving it.
# FTP (File Transfer Protocol): An Internet protocol for providing access to files located on a server and allowing users to download from it and upload to it.

puts 'getting / accessing a web page'
# 1 The net/http library
# connects to a web server and returns the content of a file to be displayed
require 'net/http'
Net::HTTP.start('www.rubyinside.com') do |http|
  req = Net::HTTP::Get.new('/test.txt')
  puts http.request(req).body
end

# 2 net/http using URI
require 'net/http'
url = URI.parse('http://www.rubyinside.com/test.txt')
Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  puts http.request(req).body
end

# OR # which is same as above
require 'net/http'
url = URI.parse('http://www.rubyinside.com/test.txt')
response = Net::HTTP.get_response(url)
puts response.body


puts 'Checking for Errors and Redirects'
# Other times you might want t check for errors and may be redirects
require 'net/http'
def get_web_document(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  case response
    when Net::HTTPSuccess
      return response.body
    when Net::HTTPRedirection
      return get_web_document(response['Location'])
    else
      return nil
  end
end
puts get_web_document('http://www.some_address.com/existent.txt') #
puts get_web_document('http://www.some_address.com/non-existent.txt') #
puts get_web_document('http://www.some_address.com/redirect-existent') #
# More granular ways of checking for errors inlcude the 404 error for 'File Not Found' returned by the Net::HTTPNotFound class, the 403 error for 'Forbidden' returned by the Net::HTTPForbidden class. More HTTP errors can be found by looking them up.


puts 'Basic Authentication'
# net/http also supports the Basic Authentication scheme used by many web servers to protect their documents in a password-protected area. Ex. is
require 'net/http'
url = URI.parse('http://browserspy.dk/password-ok.php')
Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  req.basic_auth('test', 'test') # authentication
  puts http.request(req).body
end
# Note that Authentication is ignored on requests for unprotected URLs; but if you were trying to access a URL protected by Basic Authentication, 'basic_auth' allows you to specify your credentials.


puts 'Posting Form Data / sending data to the web'
# 1
require 'net/http'
url = URI.parse('http://www.tkldmonkey.com/test.cgi')
response = Net::HTTP.post_form(url, {'name' => 'John', 'age' => '25' })
puts response.body # You say John is 25 years old
# The example above uses Net::HTTP.post_form to perform a POST HTTP request to the specified URL with the data in the hash parameter to be used as the form data.
# Note that 'test.cgi' is a special program that returns a string containing the values provided by the name and age form fields, resulting in the output above.

# 2
require 'net/http'
url = URI.parse('http://www.tkldmonkey.com/test.cgi')
Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Post.new(url.path)
  req.set_form_data({ 'name' => 'John', 'age' => '24' })
  puts http.request(req).body
end
# The above technique would allow for basic_auth method to be used if needed.


puts 'Using HTTP Proxies'
# net/http also supports proxying by creating an HTTP proxy class upon which you can then use and perform the regular HTTP methods. 
# Proxying is when HTTP requests do not go directly between the client and the HTTP server, but through a third party en route. In some situations, it might be necessary to use an HTTP proxy for your HTTP requests. This is a common scenario in schools and offices where web access is regulated or filtered.
# To create the proxy class, we use Net::HTTP::Proxy. Ex.
require 'net/http'
web_proxy = Net::HTTP::Proxy('your.proxy.hostname.or.ip', 8080)
# This call to Net::HTTP::Proxy generates an HTTP proxy class that uses a proxy with a particular hostname on port 8080.
url = URI.parse('http://www.tkldmonkey.com/test.txt')
web_proxy.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  puts http.request(req).body
end

# OR
require 'net/http'
web_proxy = Net::HTTP::Proxy('your.proxy.hostname.or.ip', 8080)
url = URI.parse('http://www.tkldmonkey.com/test.txt')
response = web_proxy.get_response(url)
puts response.body

# If your programs are likely to need proxy support for HTTP requests, it might be worth generating a proxy-like system even if a proxy isn’t required in every case. For example:
require 'net/http'
http_class = ARGV.first ? Net::HTTP::Proxy(ARGV[0], ARGV[1]) : Net::HTTP
url = URI.parse('http://www.tkldmonkey.com/test.txt')
puts http_class.get_response(url).body
# If this program is run and an HTTP proxy hostname and port are supplied on the command line as arguments for the program, an HTTP proxy class will be assigned to http_class. If no proxy is specified, http_class will simply reference Net::HTTP. This allows http_class to be used in place of Net::HTTP when requests are made, so that both proxy and nonproxy situations work and are coded in exactly the same way.


puts 'Securing HTTP with HTTPS'
# HTTP is a plain text, unencrypted protocol, and this makes it unsuitable for transferring sensi- tive data such as credit card information. HTTPS is the solution, as it’s the same as HTTP but routed over Secure Socket Layer (SSL), which makes it unreadable to any third parties. The net/https library makes it possible to access HTTPS URLs, and you can make net/http use it semi-transparently by setting the use_ssl attribute on a Net::HTTP instance to true like so:
require 'net/http'
require 'net/https'
url = URI.parse('https://example.com/')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'
request = Net::HTTP::Get.new(url.path)
puts https.request(request).body
# Note that you use the scheme method of url to detect if the remote URL is in fact one that requires SSL to be activated.
# To get a secure way of sending sensitive information to the remote server, https is used like so:
require 'net/http'
require 'net/https'
url = URI.parse('https://example.com/')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Post.new(url.path)
request.set_form_data({ 'credit_card_number' => '123456789' })
puts http.request(request).body


puts 'The open-uri Library'
# open-uri is a library that wraps up the functionality of net/http, net/https, and net/ftp into a single package. Although it lacks some of the raw power of using the constituent libraries directly, open-uri makes it a lot easier to perform all the main functions. A key part of open-uri is the way it abstracts common Internet actions and allows file I/O techniques to be used upon them. Retrieving a document from the Web becomes much like opening a text file on the local machine:
require 'open-uri'
f = open('https://example.com/')
puts f.readlines.join # some text or output
# OR

require 'open-uri'
k = open('https://example.com/')
puts "The document is #{k.szie} bytes in length"
k.each_line { |line| puts line } # 
# OR

require 'open-uri'
url = URI.parse('https://example.com/')
url.open { |x| puts x.read}
# OR perhaps

require 'open-uri'
puts URI.parse('https://example.com/').open.read

# In addition to acting like an I/O object, open-uri enables you to use methods associated with the object it returns to find out particulars about the HTTP (or FTP) response itself. For example:
require 'open-uri'
x = open('https://example.com/')
puts x.content_type # text/plain
puts x.charset # iso-8859-1
puts x.last_modified # some date and time

# It is possible to send extra header fields with an HTTP request by supplying an optional hash parameter to open:
require 'open-uri'
x = open('https://example.com/', {'User-Agent' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'})
puts x.read
# In the example above, a “user agent” header is sent with the HTTP request that makes it appear as if you’re using Internet Explorer to request the remote file. Sending a user agent header can be a useful technique if you’re dealing with a web site that returns different information to different types of browsers. Ideally, however, you should use a user agent header that reflects the name of your program.


puts 'Generating Web Pages and HTML and Processing Web Content'
# Look into Markaby or RedCloth for more info about generating HTML using ruby methods. 
# Look into Hpricot for more info on extracting data from HTML code
# Look into XML and YAML for more info about parsing / markup languages
# Look into Feedzirra for more info about parsing Web Feeds