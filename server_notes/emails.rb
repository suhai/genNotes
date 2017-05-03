puts 'E-Mail: POP3 servers and SMTP servers'
puts 'Receiving Mail with POP3'
# Post Office Protocol 3 (POP3) is the most popular protocol used to retrieve e-mail from a mail server. If you’re using an e-mail program that’s installed on your computer (as opposed to webmail, such as Hotmail or Yahoo! Mail), it probably uses the POP3 protocol to communicate with the mail server that receives your mail from the outside world.
# With Ruby, it’s possible to use the net/pop library to do the same things that your e-mail client can, such as preview, retrieve, or delete mail. If you were feeling creative, you could even use net/pop to develop your own anti-spam tools. The basic operations you can perform with a POP3 server are to connect to it, receive information about the mail an account contains, view that mail, delete the mail, and dis- connect. First, you’ll connect to a POP3 server to see if there are any messages available for download, and if so, how many:
require 'net/pop'
mail_server = Net::POP3.new('mail.mailservernamehere.com')
begin
  mail_server.start('username', 'password')
  if mail_server.mails.empty?
    puts 'No Mails'
  else
    puts "#{mail_server.mails.length} unread mails"
  end
rescue
  puts 'Mail Error'
end
You can use the Net::POPMail objects’ methods to manipulate and collect the server-based mails. To downloading all the mails, use the pop method for each   Net::POPMail object:
mail_server.mails.each do |m|
  mail = m.pop
  puts mail
end
# As each mail is retrieved (or popped) from the server, the entire contents of the mail, with headers and body text, are placed into the mail variable, before being displayed on the screen.
# To delete a mail, you can use the delete method, although mails are only marked for deletion later, once the session has ended:
mail_server.mails.each do |m|
  m.delete if m.pop =~/\bthis is a spam\b/i
end
# The code above goes through every message in the account and marks it for deletion if it contains the string 'this is a spam'
# 'pop' returns the entire mail, which could be up to many megabytes in size.
# To retrieve just the headers (useful if you’re looking for a mail with a particular subject or a mail from a particular e-mail address), use 'header', which would only return the mail’s header from the server. The following example deletes messages if their subject contains the word medicines:
mail_server.mails.each do |m|
  m.delete if m.header =~ /Subject:.+?medicines\b/i
end

# To build a rudimentary anti-spam filter, you could use a combination of the mail retrieval and deletion techniques to connect to your mail account and delete unwanted mails before your usual mail client ever sees them. Consider what you could achieve by downloading mail, passing it through several regular expressions, and then choosing to delete depending on what you match.



puts 'Sending Mail with SMTP'
# POP3 handles the client-side operations of retrieving, deleting, and previewing e-mail, whereas SMTP (Simple Mail Transfer Protocol) handles sending e-mail and routing e-mail between mail servers.
require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@privacy.net>
To: Author of Something <test@xyz.com>
Subject: SMTP e-mail message.
# this blank line is a necessary for formatting here
This is a test e-mail message
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@privacy.net', 'test@xzy.com'
end
# If you’re not running an SMTP server on your machine, you can use Net::SMTP to communicate with a remote SMTP server. Unless you’re using a webmail service (such as Hotmail or Yahoo! Mail), your e-mail provider will have provided you with outgoing mail server details that you can supply to Net::SMTP, as follows:
Net::SMTP.start('mail.your_domain.com')
# This line of code connects to the SMTP server on port 25 of 'mail.your_domain.com' without using any username or password. If you need to, though, you can specify port number and other details. For example:
Net::SMTP.start('mail.your_domain.com', 25, 'localhost', 'username', 'password', :plain)
# This example connects to the SMTP server at 'mail.your_domain.com' using a username and password in plain text format. It identifies the client’s hostname as localhost.

puts 'Sending Mail with ActionMailer'
ActionMailer makes sending e-mail higher level than using the SMTP protocol (or net/smtp) directly. Instead of talking directly with an SMTP server, you create a descendent of ActionMailer, implement a method that sets your mail’s subject, recipients, and other details, and then call that method to send e-mail. ActionMailer is a part of the Ruby on Rails framework, but can be used independently of it. Here is a basic example of using ActionMailer:
require 'rubygems'
require 'action_mailer'

class Emailer < ActionMailer::Base
  def test_email(email_address, email_body)
    recipients(email_address)
    from "me@privacy.net"
    subject "This is a test e-mail"
    body email_body
  end
end

Emailer.deliver_test_email('me@privacy.net', 'This is a test e-mail!')
# A class, Emailer, is defined, and descends from ActionMailer::Base. The test_email method uses ActionMailer’s helper methods to set the recipient, from address, subject, and body of the e-mail, but you never call this method directly. To send the mail, you call a dynamic class method on the Emailer class called deliver_test_email (or 'deliver_' followed by whatever you called the method in the class).
# In the example above, ActionMailer uses the default settings for mail output, and that is to try to connect to an SMTP server on the local machine. If you don’t have one installed and running, you can instruct ActionMailer to look for an SMTP server elsewhere, like so:
ActionMailer::Base.server_settings = {
  :address => "mail.your_domain.com",
  :port => 25,
  :authentication => :login,
  :username => "username",
  :password => "password",
}
# These settings are similar to those you used to set up Net::SMTP and can be changed to match your configuration.
# You may also look into 'Pony', another mail sending library.