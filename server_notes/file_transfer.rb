puts 'File Transfers with FTP: open-uri vs net/ftp'
# File Transfer Protocol (FTP) is a basic networking protocol for transferring files on any TCP/IP network. Although files can be sent back and forth on the Web, FTP is still commonly used for large files, or for access to large file repositories that have no particular relevance to the Web. One of the benefits of FTP is that authentication and access control is built in.
# The core part of the FTP system is an FTP server, a program that runs on a file server that allows FTP clients to download and/or upload files to that machine.
# For example to download a file from an FTP server and saves its contents into a local file. you may write and run a code like this:
require 'open-uri'

output = File.new('1.8.2-patch1.gz', 'wb')
open('ftp://ftp.ruby-lang.org/pub/ruby/1.8.2.-patch1.gz') do |f|
  output.print f.read
end
output.close
# However, for more complex operations, the net/ftp library is ideal, as it gives you lower- level access to FTP connections, as net/http does to HTTP requests.
# Connection and Basic FTP Actions
require 'net/ftp'
require 'uri'

uri = URI.parse('ftp://ftp.ruby-lang.org/')
Net::FTP.open(uri.host) do |ftp|
  ftp.login 'anonymous', 'me@privacy.net'
  ftp.passive = true
  ftp.list(uri.path) { |path| puts path }
end
# ["drwxrwxr-x    5 106      111          4096 Dec 25  2013 pub"]



puts 'Downloading Files'
# Downloading files from an FTP server is easy if you know the filename and what type of file you’re trying to download. Net::FTP provides two useful methods to download files: getbinaryfile and gettextfile. Plain text files and binary files (such as images, sounds, or applications) are sent in a different way, so it’s essential you use the correct method. In most situations, you’ll be aware ahead of time which technique is required. Here’s an example showing how to download a binary file from the official Ruby FTP server:
require 'net/ftp'

ftp = Net::FTP.new('ftp.ruby-lang.org')
ftp.passive = true
ftp.login
ftp.chdir('/pub/ruby/1.8')
ftp.getbinaryfile('1.8.2-patch1.gz')
ftp.close
# getbinaryfile accepts several parameters, only one of which is mandatory. The first parameter is the name of the remote file (1.8.2-patch1.gz in this case), an optional sec- ond parameter is the name of the local file to write to, and the third optional parameter is a block size that specifies in what size chunks (in bytes) the file is downloaded. If you omit the second parameter, the downloaded file will be written to the same filename in the local directory, but if you want to write the remote file to a particular local location, you can specify this.
# One problem with using getbinaryfile in this way is that it locks up your program until the download is complete. However, if you supply getbinaryfile with a code block, the downloaded data will be supplied into the code block as well as saved to the file:
ftp.getbinaryfile('ruby-1.8.7.tar.gz', 'local-filename', 102400) do |blk|
  puts "A 100KB block of the file has been downloaded"
end
# This code prints a string to the screen whenever another 100 kilobytes of the file have been downloaded. You can use this technique to provide updates to the user, rather than make him or her wonder whether the file is being downloaded or not. You could also download the file in blocks such as this and process them on the fly in the code block, like so:
ftp.getbinaryfile('ruby-1.8.7.tar.gz', 'local-filename', 102400) do |blk|
  # .. do something with blk here ..
end
# Each 100KB chunk of the file that’s downloaded is passed into the code block. Unfortu- nately, the file is still saved to a local file, but if this isn’t desired, you could use tempfile to use a temporary file that’s then immediately deleted. 
# Downloading text or ASCII-based files uses the same technique as in the preceding code, but demands using gettextfile instead. The only difference is that gettextfile doesn’t accept the third block size parameter, and instead returns data to the code block line by line.


puts 'Uploading Files'
# Uploading files to an FTP server is only possible if you have write permissions on the server in the directory to which you want to upload. Therefore, none of the examples in this section will work unedited, as you can’t provide an FTP server with write access (for obvious reasons!).
# Uploading is the exact opposite of downloading, and net/ftp provides putbinaryfile and puttextfile methods that accept the same parameters as getbinaryfile and gettextfile. The first parameter is the name of the local file you want to upload, the optional second parameter is the name to give the file on the remote server (defaults to the same as the uploaded file’s name if omitted), and the optional third parameter for putbinaryfile is the block size to use for the upload. Here’s an upload example:
require 'net/ftp'

ftp = Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')
ftp.putbinaryfile('local_file')
ftp.close

# As with getbinaryfile and gettextfile, if you supply a code block, the uploaded chunks of the file are passed into it, allowing you to keep the user informed of the progress of the upload.
require 'net.ftp'

ftp = Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')
count = 0
ftp.putbinaryfile('local_file', 'local_file', 100_000) do |block|
  count += 100_000
  puts "#{count} bytes uploaded"
end
ftp.close

# If you need to upload data that’s just been generated by your Ruby script and isn’t within a file, you need to create a temporary file with tempfile and upload from that. For example:
require 'net.ftp'
require 'tempfile'

tempfile = Tempfile.new('test')
my_data = "This is some text data I want to upload via FTP."
tempfile.puts my_data

ftp.Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')

ftp.close
tempfile.close