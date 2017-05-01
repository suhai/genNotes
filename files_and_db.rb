puts 'Manipualting Files and Databases'

# Note that when you get into pry mode, pry intializes from the current directory so you are within a ruby environment within the current directory. For example, if you initialize pry while in the desktop directory, you can use File.rename("old_file_name", "new_file_name") only of "old_file_name" is located within the desktop directory.

# Find out more info about yaml


# I/O: Input/output. The concept of receiving input and sending output by various means on a computer, often via I/O streams.

# I/O stream: A channel along which data can be sent and/or received.
# Standard input (stdin): A stream that relates to the default way of accepting data into the application, usually the keyboard.

# Standard output (stdout): A stream that relates to the default way of outputting data from the application, usually to the screen.

# File pointer: An abstract reference to the current “location” within a file.
# Database: An organized collection of data structured in a way that makes it easy to be accessed programmatically.

# CSV (comma-separated values): A way of structuring data with attributes separated with commas. CSV can be stored in plain text files.

# Marshalling: The process of converting a live data structure or object into a flat set of data that can be stored on disk, sent across a network, and then used to reconstruct the original data structure or object elsewhere or at some other time.

# Table: A collection of data organized into rows, with multiple columns, where each column represents a different attribute of each row. There are usually multiple tables within a database, containing different types of data.

# SQLite: An open source, public-domain relational database API and library that works on a single-user basis on a local machine. It supports SQL as its querying language.

# MySQL: An open source relational database system available in both community and professional editions. It is maintained by MySQL AB. Web hosting companies commonly offer MySQL database support.

# PostgreSQL: A free, open source relational database system licensed under the
# BSD license, making it possible to repackage and sell within commercial products. PostgreSQL is often considered to be of higher performance and have better conformity to SQL standards than MySQL, although it’s less popular at the time of writing.

# Oracle: A commercial relational database system developed by Oracle Corporation. It’s generally used by large businesses for managing extremely large datasets.

# Primary key: A column (or multiple columns) on a table whose data uniquely identifies each row.

# DBI (DataBase Interface): A database-agnostic library that makes it easy to communicate between Ruby and database systems.

# SQL (Structured Query Language): A language specifically designed to create, amend, retrieve, and otherwise manipulate data in relational database systems.

# ActiveRecord: A library that abstracts databases, rows, columns, and SQL into standard Ruby syntax using classes and objects. It’s a major part of the Ruby on Rails framework, which is covered in detail in Chapter 13.

File.open("person.rb").each { |line| puts line }
File.open("person.rb").each(',') { |line| puts line }
File.open("person.rb").each('.') { |line| puts line }
File.open("person.rb").each_byte { |byte| puts byte }
File.open("person.rb").each_char { |char| puts char }
File.open("person.rb") do |x|
  puts x.gets
end
File.open("person.rb") do |x|
  2.times { puts x.gets }
end
# There’s also a noniterative version of each_byte called getc:
File.open("person.rb") do |x|
  2.times { puts x.getc }
end
File.open("person.rb") do |x|
  2.times { puts x.gets(',') }
end
# You can also read an entire file into an array, split by lines, using readlines:
File.open("person.rb").readlines.join('--')
# You can choose to read an arbitrary number of bytes from a file into a single variable using read:
File.open("person.rb") do |x|
  puts x.read(5)
end
# The File class makes some convenient methods available so that you don’t need to do things like File.open(filename).read to be able to read a file into a string. Instead, you can do this:
data1 = File.read(filename)
puts data1
array_of_lines = File.readlines(filename)
puts array_of_lines


File.new("person.rb", "r").each { |line| puts line }
f = File.new("file_path/person.rb", "r")
puts f.gets
puts f.close
class MyFile
  attr_reader :handle

  def initialize(filename)
    @handle = File.new(filename, "r")
  end

  def finished
    @handle.close
  end 
end
f = File.new("person.rb")
puts f.handle.gets
f.finished

puts 'Your Position Within a File'
# When reading a file, it can be useful to know where you are within that file. The 'pos' method gives you access to this information:
f = File.open("filename")
puts f.pos
puts f.gets
puts f.pos
# You an alos navigate to a particular position by:
f.pos = 10 # would take you 8 bytes from your current location in the file
puts f.gets
puts f.pos

puts 'Writing into a file'
File.open("filename", "w") do |x|
  x.puts "some input data"
end
# The code above would create a new file or overwrite an existing file with the same name and input the data "some input data".
f = File.new("log_file.txt", "a") 
f.puts Time.now
f.close     
puts "Some Properties of the I/O Stream"
# mode  Properties of the I/O stream
# r     Read-only. The file pointer is placed at the start of the file.
# r+    Both reading and writing are allowed. file pointer is placed at start
# w     Write-only. A new file is created or an old one overwritten
# w+    Both reading and writing are allowed, but File.new creates a new file
# a     Write (in append mode). The file pointer is placed at the end of the file and writes will make the file longer.
# a+    Both reading and writing are allowed (in append mode). The file pointer is placed at the end of the file and writes will make the file longer.
# b     Binary file mode. You can use it in conjunction with any of the other modes listed. This mode may not be available in other ruby versions

puts 'Renaming and Deleting Files'
File.rename("file_name", "new_file_name")
File.delete("file_name")
File.delete("file_name1", "file_name2", "file_name3")
File.unlink("file_name") # acts just like delete

File.join('full', 'path', 'file_name') # gives /full/path/file_name
File.join(File::SEPARATOR, 'full', 'path', 'file_name') # /full/path/file_name
File.expand_path('file_name') # give the file path with current dir as base

f = File.new("file_name", "r+")
f.seek(-5, IO::SEEK_END)
f.putc 'X'
f.close
# The code above would you would position the file pointer 5 bytes from the end of the file and change the character to an 'X'.

f = File.new('file_name', 'r')
while a = f.getc
  puts a.chr
  f.seek(5, IO::SEEK_CUR)
end
# The above code would print every fifth character in a file.
# seek has three modes of operation:
#   IO::SEEK_CUR: Seeks a certain number of bytes ahead of the current position.
#   IO::SEEK_END: Seeks to a position based on the end of the file. This means that to seek to a certain position from the end of the file, you’ll probably need to use a negative value.
#   IO::SEEK_SET: Seeks to an absolute position in the file. This is identical to pos=.

puts File.mtime('file_name') # would give the time the file was last modified 
puts 'Yeaaaaaaah' if exists?('file_name') # checks if file_name exists
class MyFile
  attr_reader :handle

  def initialize(file_name)
    if File.exists?(file_name)
      @handle = File.new(file_name, 'r')
    else
      return
    end
  end
end

puts File.soze('file_name') # gives the size of file_name in bytes

puts 'How to know when you are at the end of a file'
f = File.new('file_name', 'r')
catch(:end_of_file) do 
  loop do 
    throw :end_of_file if f.eof?
    puts f.gets
  end
end
f.close



puts 'BASIC DATABASES'
require 'csv'
CSV.open('file_name', 'r').each do |x|
  puts x.inspect
end

people = CSV.parse(File.read('file_name'))
puts people[0][0]
puts people[1][1]
puts people[2][0]

puts CSV.read('file_name').inspect

people2 = CSV.read('file_name')
people2.find { |person| person[0] =~/laura/ }.inspect
young_peeps = people2.find_all do |peeps|
  peeps[3].to_i.between?(20, 40)
end
puts young_peeps.inspect

puts 'RELATIONAL DATABASE'
# MySQL, PostgreSQL, Oracle, SQLite
# A typical database table creation uses the syntax:
# CREATE TABEL table_name (
# col1_name data_type options,
# col2_name data_type options,
# ....,
# ...
# );
# An example is:
# CREATE
CREATE TABLE people (
id integer primary key,
name varchar(50),
job varchar(50),
gender varchar(6),
age integer
);
# The code above would create a peopel table with 5 columns  named id, name, job, gender, and age.

# INSERT
INSERT INTO 
  people (name, job, gender, age)
VALUES  
  ('Tom', 'student', 'male', 25);


# SELECT
SELECT
  *
FROM 
  people
  GROUP BY
    #abc
  HAVING 
    #abc
WHERE 
  #abc
ORDER BY

# ASC, DECS, LIMIT, BETWEEM, IN, and AS are other commands that can be used withj select

# DELETE
DELETE FROM people WHERE name = 'some_name'
DELETE FROM people WHERE age = 20
DELETE FROM people WHERE name = 'some_name' AND gender = 'male'

# UPDATE
SELECT * FROM people WHERE name = 'some_name';
UPDATE people SET name = 'some_new_name' WHERE name = 'some_name';
