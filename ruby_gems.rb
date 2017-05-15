#!/usr/bin/env ruby

puts 'This is to test the shebang!'
puts RUBY_PLATFORM # to check your platform platform. Mac OS is darwin
ENV.each {|x| puts x.join(':')} # to inspect the environment variables

puts 'RUBY GEMS'
# RubyGems is a packaging system for Ruby programs and libraries. It enables developers to package their Ruby libraries in a form that’s easy for users to maintain and install.

# use '$ gem list' to see the list of all gems on yiur system
# use '$ gem list --remote'to see the list of available remote gems
# use '$ require 'rubygems' to load up the entire ruby gems library
# use '$ gem install name_of_gem' to install a particular gem
# use '$ gem uninstall name_of_gem' to uninstall a particular gem
# use '$ gem update name_of_gem' to update a particular gem
# use '$ gem update to update all gems
# to use a particular gem in a file or program, the gem needs to be required like: require 'name_of_gem'
# go to http://guides.rubygems.org/ for more info if needed 


puts 'Creating a simple ruby gem the long and hard way'
# Building a gem involves three steps. 
# 1. Organize your code and other files into a structure that can be turned into a gem. 
# 2. Create a specification file that lists information about the gem. 
# 3. Use the gem program to build the gem from the source files and the specification.

# 1
# Create a folder named after your gem. Ex. string_extend.
# Inside this folder, create these subfolders: 
# 1. lib: This directory will contain the Ruby code related to the library.
# 2. pkg: This is a temporary directory where the gem will be generated.
# 3. test: will contain any unit tests / other testing scripts related to lib.
# 4. doc: This is an optional directory that could contain documentation about the library, particularly documentation created with or by rdoc.
# 5. bin: This is another optional directory that can contain system tools and command line scripts that are related to the library. For example, RubyGems itself installs the gem commandline tool; such a tool would be placed into bin.

class String # I am extending the String class here
  def vowels
    scan(/[aeiou]/i)
  end
end
# 'This is a test'.vowels # ['i', 'i', a'. 'e']
# put the above code in a file and name it whatever you want. ex. string_extend.rb. Next place string_extend.rb inside string_extend/lib folder.

# 2
# create a specification file that describes the gem
# and provides RubyGems with enough information to create the final gem. Create a text file called string_extend.gemspec (or a filename that matches your own project name) in the main string_extend folder, and fill it out like so:
require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'string_extend'
  s.version = '0.0.1'
  s.summary = 'StringExtend adds vowel features to the String class'
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = 'Your Name'
  s.email = 'your_email'
  s.has_rdoc = false
  s.required_ruby_version = '>= 1.8.2'
end

# The specification file above is effectively a simple Ruby script that passes information through to Gem::Specification. A full list of parameters that can be used in a RubyGems specification file can be found online.

# 3
# run '$ gem build string_extend.gemspec' from within the string_extend folder. This would create the final gem file: string_extend-0.0.1.gem
# In the future, once you change and update your library, simply update the version numbers and rebuild, and you’ll have a new gem ready to go that can be installed to upgrade the existing installed gem.
# After this point, you could install your own gem with $ gem install string_extend, and then use it from other scripts using require 'string_extend'.

puts 'Creating a simple ruby gem the easy way'
# Ensure that you have newgem installed on your machine, otherwise first run:
# $ gem install newgem
# Once newgem is installed, you can create gem directory structures and default files with:
# $ newgem <name_of_library>
# Note that there are now newer ways to create gems, including using:
# $ bundle gem my_gem
# Look into the most up to date way of creating gems.


# SOME COMMON RUBY GEMS AND THEIR USES
# 1. net/http
require 'net/http'
Net::HTTP.get_print('www.rubyinside.com', '/')
# The above script is can be used to downlaod and print the content of a webpageto the console

require 'net/http'
url = URI.parse('http://www.rubyinside.com/')
response = Net::HTTP.start(url.host, url.port) do |http|
  http.get(url.path)
end
response.body
# The above script can be used to put the contents of any Web page into a string, for further manipulation by a particular program.

# 2. RedCloth
require 'rubygems'
require 'RedCloth'
example = RedCloth.new("this is a *test* of _using RedCloth_")
puts example.to_html # <p>this is a <strong>test</strong> of <em>using RedCloth</em></p>
# The RedCloth gem can be used to convert specially formatted text into html ready to be used on a webpage.


puts 'List of Some Useful libraries'
