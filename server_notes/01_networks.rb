puts 'General info'
# A machine on an IP-based network has one or many unique IP addresses. When data is sent across the network to a particular IP address, the machine with that address will receive the data. When you use the Web and access a web site such as tkldmonkey.com, your computer first asks a Domain Name Service (DNS) server for the IP address associated with the hostname tkldmonkey.com. Once it gets the raw address in response (in this case 184.168.221.62), your web browser makes a connection to that machine on port 80. Machines can make and receive connections on different TCP (or UDP) ports (from a range of 0 through 65,535), and different ports are assigned to different types of services. For example, port 80 is the default port used for web servers.

# A network is a group of computers connected in some fashion. If you have several computers at home all sharing a wired or wireless router, this is called your local area network (LAN). Your computers are probably also connected to the Internet, another form of network. Networking is the overall concept of communications between two or more computers or devices.

# Network: A collection of computers connected in such a way that they can send and receive data between one another.
# TCP (Transmission Control Protocol): A protocol that handles connections between two machines over an IP-based network, and ensures packets are transmitted and received successfully and in the correct order.
# UDP (User Datagram Protocol): A protocol that allows two computers to send and receive messages between each other where no “connection” is made and no assurances are made whether the data is received by the remote party. UDP is sometimes also used for streaming video and audio due to its low overhead and latency.
# IP (Internet Protocol): A packet-based protocol for delivering data across networks. IP also makes provisions for each machine connected to the network to have one or many IP addresses.
# DNS (Domain Name Service): A system of referencing host or machine names against different IP addresses and converting between the two. For example, a DNS server will convert tkldmonkey.com into the IP address 184.168.221.62.
# Ping: The process of verifying whether a machine with a particular IP is valid and accepting requests by sending it a small packet of data and waiting for a response.
# Server: A process that runs on a machine and responds to clients connecting to it from other machines, such as a web server.
# Client: A process that connects to a server, transmits and receives data, and then disconnects once a task is completed. A web browser is a basic example of a client.                 
# GServer: A Ruby library that makes developing network servers and services easy. It handles the thread and connection management and allows servers to be created by simply subclassing the GServer class.
# Daemon: A process that runs continually and silently in the background on a machine and isn’t run directly by a user. Daemon processes are often used to run servers, as they run consistently without any interaction requirements on the local machine. A process that is then turned into a daemon is said to be daemonized.

# 1
puts 'ping-ing'
# A 'ping' is a simple check that another machine is available on the network or that a service it offers is available. You connect directly to website’s HTTP port as if you were a web browser, but immediately disconnets once you get a connection. This helps verify that the website is accepting HTTP connections.The ruby gem 'net-ping' can interface with your operating system’s ping command to get a reliable response. It can also connect directly to services offered by a remote machine to gauge whether it’s responding to requests or not. Ex:
require 'rubygems'
require 'net/ping'

# if Net::Ping::External.new('localhost').ping
if Net::Ping::External.new('www.google.com').ping
  puts 'Pong!'
else
  puts 'No Response'
end


# 2
puts 'DNS Queries'
# Most networking libraries allow you to specify domain names and hostnames when you want to interact with a remote server, and automatically resolve these names into IP addresses. However, this adds a small overhead, so in some situations you might prefer to resolve IP addresses ahead of time yourself.
# You might also use DNS queries to check for the existence of different hostnames and to check whether a domain is active or not, even if it’s not pointing to a web server. 'resolv' is a ruby library that offers several methods that are useful for converting between hostnames and IP addresses:
require 'resolv'
puts Resolv.getaddress('localhost') # ::1
puts Resolv.getaddress('www.tkldmonkey.com') # 184.168.221.62

puts Resolv.getaddress('www.google.com') # 172.217.6.68
# puts Resolv.getaddresses('www.google.com')
puts Resolv.getname('172.217.5.100') # sfo03s07-in-f100.1e100.net
# puts Resolv.getnames('172.217.5.100', '184.168.221.62')
# Note that not all IP addresses resolve back into hostnames, as this is an optional requirement of the DNS system.
# resolv can also retrieve other information from DNS servers, such as the mail server(s) associated with a particular host or domain name. Whereas the records of which IP addresses are associated with which hostnames are called A records, the records of which mail servers are associated with a host-name are called MX records. To search for MX records, you have to use the Resolv::DNS class directly so you can pass in the extra options needed to search for different types of records:
require 'resolv'

Resolv::DNS.open do |dns|
  mail_servers = dns.getresources('google.com', Resolv::DNS::Resource::IN::MX)
  mail_servers.each do |server|
    puts "#{server.exchange.to_s} - #{server.preference}"
  end
end
# alt3.aspmx.l.google.com - 40
# aspmx.l.google.com - 10
# alt2.aspmx.l.google.com - 30
# alt4.aspmx.l.google.com - 50
# alt1.aspmx.l.google.com - 20

# MX records are useful if you want to send e-mail to people but you have no SMTP server you can send mail through, as you can use Net::SMTP directly against the mail servers for the domain name of the email address you want to send to. For example, if you wanted to email someone whose email address ended with @google.com, you could use Net::SMTP to connect directly to smtp2.google.com (or any of the other choices) and send the mail directly to that user:
# require 'resolv'
# require 'net/smtp'

# from = "your_email_address"
# to = "receiver_email_address"
# message = <<MESSAGE_END
# From: #{from}
# To: #{to}
# Subject: Direct email test
# This is a test email message.
# MESSAGE_END

# to_domain = to.match(/\@(.+)/)[1]

# Resolv::DNS.open do |dns|
#   mail_servers = dns.getresources(to_domain, Resol::DNS::Resource::IN::MX)
#   mail_servers = mail_servers[rand(mail_servers.size)].exchange.to_s

#   Net::SMTP.start(mail_server) do |smtp|
#     smtp.send_message message, from, to
#   end
# end


puts 'Connecting to a TCP Server Directly'
# One of the most important networking operations is connecting to a service offered by another machine (or in some cases, even your local machine!) and interacting with it in some way. It is possible to connect directly to remote services at the TCP level and talk to them in their raw format. This can be useful to investigate how different protocols work (as you’ll need to use and understand the protocol’s raw data) or to create simple protocols of your own.
# To connect to a TCP port directly, you can use a tool called telnet. telnet is a protocol to provide a general, bidirectional, 8-bit, byte-oriented communications facility. Its name comes from “telecommunication network.” You’re only concerned with its ability to let you easily connect to raw TCP ports.
# To use net/telnet to connect to a web site and retrieve a web page using the HTTP protocol directly:
require 'net/telnet'

server = Net::Telnet::new('Host' => 'www.rubyinside.com',
'Port' => 80,
'Telnetmode' => false)
server.cmd("GET /test.txt HTTP/1.1\nHost: www.rubyinside.com\n") do |response|
  puts response
end
# HTTP/1.1 200 OK
# Date: Wed, 03 May 2017 05:37:10 GMT
# Server: Apache/2.2.22 (Ubuntu)
# Last-Modified: Sun, 15 Oct 2006 01:24:13 GMT
# ETag: "1210ab-1d-41fcf61012940"
# Accept-Ranges: bytes
# Content-Length: 29
# Vary: Accept-Encoding
# Content-Type: text/plain
# X-Pad: avoid browser bug
# Hello Beginning Ruby reader!

# What happened with the above code is that Net::Telnet connects to www.rubyinside.com on port 80 (the standard HTTP port) and
# issues these commands:
# GET /test.txt HTTP/1.1
# Host: www.rubyinside.com                  
                        
# These commands are part of the HTTP protocol and tell the remote web server to return you the test.txt file from www.rubyinside.com. The response is then printed to the screen where the first eight or so lines are HTTP headers, another part of the HTTP protocol.
# All these technicalities are shielded from you when you use the open-uri and Net::HTTP libraries.



puts 'SERVERS and CLIENTS'
# Clients and servers are the two major types of software that use networks. Clients connect to servers, and servers process information and manage connections and data being received from and sent to the clients.

# TCP servers are the foundation of most Internet services. Although lightweight time servers and DNS servers can survive with UDP, when sending web pages and e-mails around, it’s necessary to build up a connection with a remote server to make the requests and send and receive data.

# Most servers on the Internet are designed to deal with large numbers of clients at any one time. A web server that can only serve one file at once would quickly result in the world’s slowest web site as users began to stack up waiting to be served! Such TCP servers are commonly known as a “single-threaded”or “sequential” server.

# Servers that accepts requests and immediately creates a new thread of execution to process the connection while allowing the main program to await more connections are commonly known as multithreaded servers.
# Ruby’s Thread class makes it easy to create a multithreaded server.

# Web/HTTP Servers
# Web servers are also TCP servers, and use many of the same techniques covered in the last few sections, such as forking and threading. A web server is a normal TCP server that talks HTTP.


puts 'Daemon Processes'
# A daemon process is one that runs continually and silently in the background on a machine and is not run directly by a user. Daemon processes are often used to run servers, as they run consistently without any interaction requirements on the local machine.
# In the past examples, the servers have all run as normal applications at the command line. They can print to the screen, and if you use Ctrl+C you can close them. However, servers typically run as daemon processes that operate independently of any shell or terminal.

# In the “Multi-Client TCP Servers”, a basic server that forked five separate processes to listen for and process client connections was created. It resulted in processes running in the background, but they weren’t truly separate. The processes still output their error messages to the current screen, and they were still attached to the parent process, even though it had died.

# To make a program run as a background daemonized process, it’s necessary to perform a few operations:
# 1. Fork the process to allow the initial process to exit.
# 2. Call the operating system’s setside function to create a new session separate from any terminal or shell.
# 3. Fork the process again to ensure the new daemon process is an orphan process, totally in control of itself.
# 4. Change the working directory to the root directory so that the daemon process isn’t blocking erase access to the original present working directory.
# 5. Ensure that standard output, standard input, and standard error file handles (STDIN, STDOUT, STDERR) aren’t connected to any streams.
# 6. Set up a signal handler to catch any TERM signals so that the daemon will end when requested.

