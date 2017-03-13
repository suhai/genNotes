#
  # HOW THE WEB WORKS
  # -----------------
  # . IP address: Internet Protocol address is a numerical ID for a device on a network. IP addresses usually have four sets of numbers, each between 0 to 255, separated by dots (ex. 255.255.255.255, 244.155.65.2). traditionally there have been IP v4, but there is also now IP v 6 similar to IP v 4 but with six instead of four sets of numbers.

  # . Client-Server Model: This is the idea of a client and server communicating over a network.

  # . Client: Is an application (ex. Chrome, Safari, a tablet, etc) that runs ona computer and is conneected to the internet. This is what users generally interact with. A client/ computer has a unique IP address.

  # . Server: Is a machine connected to the internet that responds to requests from client computers. A server also has a unique IP address. Servers primarily store, process, amd deliver web pages to clients. Ex include web servers, database servers, file servers, application servers, etc. Servers usually listen to a port number or multiple port numbers. For example, a server can fetch data from facebook.com while also fetching email form gmail on the same computer. These two actions occur via differentr ports. One can set up an http server to listen to a specific port. The servers wait for clients requests coming to the specific port, performs any action and send any requested data via an http response. Servrs usually have faster CPUs, higher performance RAMs, more storag, and are more resilient than personal devices. They also have backup power supply and backup storage.

  # . A Service: This is just another server that interacts exclusively with other servers, as opposed to a traditional web server which interacts with clients. 'services' are usually specialized for specific functions, ex Search service, Email service, Gaming service, etc. These services are contacted by a web server when requests are made to the web server. 

  # . ISP: Internet Service Providers serve as links between clients and servers. They use DNS lookups to match IP addresses to sites.

  # . DNS: Domain Name System is a distributed database which keeps tarck of computer's domain names and their corresponding IP addresses on the internet.

  # . Domain Name: is used to ID one or more ip addresses. Ex www.tkldmonkey.com is the domain name that can take a client to the IP address for the site identified by the domain name.

  # . HTTP: Hypertext Transfer Protocol is a set of rules for asking for and receiving webpages. They are used by web broweser and servers to communicate with each other over the internet. HTTPS is a more secure form of HTTP.

  # . Protocol: This is a set of rules for doing something. It uses TLS/SSL (Transport Layer Security / Secure Socket Layer) which are cryptographic protocols used to provide a secure connection between a computer and a network.

  # . TCP/IP: Transfer Control Protocol / Internet Protocol is the most widely used communication protocol. It is the standard for transmitting data over networks. It is an even more basic set of protocols under HTTP for sending and recieving data, whether its email, webpages, files, etc. 
  # When a client initiates a request, TCP splits the request into packets before destination and reassmbles response after destination. The fragments of data are sent as fast as possible from client to server and back again. This is sent wirelessly over radio waves, either to a router or directly to a wireless modem. this is then transmitted through a coaxial cable to the outside where the clients ISP connects to the internet. IP tells the packest where (ports) to go and where (ports) to return. 

  # . Port Number: is a 16-bit integer that IDs a specific port on a server and is always associated with an IP address.

  # . Host: is a compter connected to a network . A host can be a client, a server, or any other type of device. Servers are subsets of hosts.

  # . URL: Uniform Resource Locators identify a particular web resource. A url specifies the protocol (ex. https), the host name (ex. tkldmonkey.com), and filename or resource (ex. /Technology) as seen in 'https:www.github.com/xxx'. 

  # . TLD: Top Level Domain is the root name of a domain name such as .com, .edu, .gov, .net, .uk, .io, etc

  # . DOM: Document Object Model is a convetion for how to represent objects located in an html document.

  # During a typical webpage request, a request is sent to the ISP, which does a DNS lookup for the TLD (EX. .com), then the domain name using the desired IP address. When it finds the request address, it opens a TCP socket connection and the client's web browser is connected to the web server. From here on the web browser can send http request to the web browser for the main html webpage(s). If the pages exists, the web server prepapres a response to send back to the browser. Otherwise it would send an http 404 error message 'Page Not Found'. The web browser takes html pages it receives to do a full a head to toe scan for assets such as images, css files, javascript file, etc. The browser makes http requests to the sever for each listed asset. Then fully load the browser once resource/asset has been loaded before closing the connection.
  # In a home setting, a coaxial cable for cable internet, a phone line for DSL (Digital Subscriber Line) or a dish / phone line (if in very rural areas) runs to the outside of the home that to connect the home to the ISP.
  # The modem is the link between the ISP and the home computer. The modem translates digital data from a computer into electrical signals to be transmitted over cable or telephone wires. Modems used to be connected to routers but they are increasing being combined with routers in a single device by most ISPs.

  # . Database: is a place to store information so that it can be easily accessed, managed, and updated. Ex. CLIENT <=====> SERVER <=====> DATABASE

  # . Load Balancer: acts as traffic cop that routes client requests across the servers in a fast and most efficient manner possible. 

  # . CDN: Content Delivery Network is a large distributed system of 'proxy' servers deployed across many data centers. It acts as an intermediary between clients and a server separated by significant distances such as ,amny time zones apart. Ex of a CDN is Akamai.

  # . REST: Representational State Transfer

  # . GET: read only
  # . POST: creates a new resource
  # . PUT: updates a resource
  # . DELETE: deletes a resource

  # . DNS / RECORDS
  #   When a client contacts a server for information, a set of Records is returned. Ex of a record is the 'A' record.
  # .1 'A' Record: This is a multilevel domain that maps host names to IP addresses. AAAA record is IP v 6 equivalent of A for IP v 4. Ex swy.tkldmonkey is an A record for swy in the tkldmonkey.com domain. This can be assigned to a particular IP address. Another example would be boys.swy.tkldmonkey. Using a '* wildcard' like *swy.tkldmonkey.com will redirect all queries 'xxx.swy.tkldmonkey.com' to swy.tkldmonkey.com.

  # .2. MX Record: This is reponsible for pointing the servers that accept email messages. 
  #  - it specifies how mail should be routed via SMTP (Simple Mail Transfer Protocol) 
  #  - it is usually specified via FQDN (Fully Qualified Domain Name) 
  #  - it specifies the different priority of servers for accepting email messages. The highest MX record is the primary server, and the backup servers are responsible for knowing when the primary server is back up and running after it goes down.

  # .3. CNAME Record: Canonical Name record is usually used for aliases. For ex, if you had a restaurant chain in 5 big cities you could use CNAME instead of A records. you can use CNAME to point them all to the restaurant url and then serve speciifc pages for each distinct city site. This has the benefit of only needing to change this in one spot in case the IP address changes.

  # .4. TXT Record: This can contain free form fo any type. Service providers use it to verify domain ownership. There are different types of TXT records.
  #   - SPF (Sender Policy Framework) which tells you what kind of host can send/recieve mail on your behalf. SPF also allwos you to include aother domains. Ex of an SPF record is: v=spf1 include:_spf.gogle.com ~ all which means spf.google.com will manage sending email on your behalf.
  #   - DKIM (DomainKeys Identified Mail) whci asxociates a domain name to an email message, thereby allowing responsibility for the message to be claimed.

  # .5. PTR Records: Pointer Records are used for reverse DNS. They help determine that a domain name is associated with a given IP address.

  # .6. SOA (Start Of Authority):



  # HTTP STATUS CODES (usually 3 numbers long)
  # 100 responses are Informational
  # 200 responses means Success
  # 300 responses means Redirection
  # 400 responses means a cleint Error
  # 500 responses means a server Error
