puts 'RDoc Notes'
# RDoc: A tool that comes with Ruby that builds HTML documentation using the structure and comments in your source code.

# Debugging: The process of resolving errors in source code, often by stepping through and inspecting the state of a program in situ.

# Test-driven development/test-first development: The development process of first writ- ing tests that enforce certain expectations, then writing the code to produce the correct results. Behavior-driven development is a popular alternative that merely uses different semantics.

# Test case: A group of tests to check the functionality of a section of your program (for example, a class or module).

# Assertion: A single test to see whether a certain condition or result is met, which checks that a certain piece of code is working properly.
                     
# Unit testing: The process of testing code by making assertions on its various pieces of functionality to make sure each operates as expected.

# Optimization: The process of improving the efficiency of your code by reworking algorithms and finding new ways of solving problems.

# Benchmarking: A process involving testing the speed of your code to see how quick it is under certain conditions, or using certain methods and algorithms. You can use the benchmark results to compare different versions of code, or compare coding techniques.

# Profiling: A process that shows you which methods and routines are taking up the most execution time (or memory) in your programs.


puts 'Generating Documentation with RDoc'
# http://rdoc.sourceforge.net/doc/
# RDoc is a tool that reads through one's Ruby source code files and creates structured HTML documentation for the particular file(s).
# RDoc understands a lot of Ruby syntax and can create documentation for classes, methods, modules, and numerous other Ruby constructs without much prompting. The way you document your code in a way that RDoc can use is to leave comments prior to the definition of the class, method, or module you want to document. For example:
# This class stores information about people
class Person
  attr_accessor :name, :age

  #create the person object and store their name
  def initialize(name, age)
    @name = name
    @age = age
  end

  #print the person's name
  def print_name
    puts "This person is called #{@name}"
  end  
end

# This is a simple class that’s been documented using comments. It’s quite readable already, but RDoc can turn it into a pretty set of HTML documentation in seconds. To use RDoc, simply run it from the command line using:
# $ rdoc <name_of_file>.rb 
# For the file above contained in a file named 'person.rb' I would run:
# $ rdoc person.rb 
# rdoc would produce an html documentation inside a 'doc' folder within the same directory where 'person.rb' is contained. some of the folders and files that may be found within an rdoc include:
# Person.html            fonts                  js
# created.rid            images                 table_of_contents.html
# css                    index.html
# The html can be opened and viewed to see what rdoc created.

# RDoc can also be used in the production of a large project with multiple files. If you run rdoc with no filenames supplied, RDoc will process all the Ruby files found in the current directory and all other directories under that. The full documentation is placed into the doc directory, as before, and the entire set of documentation is available from index.html.
# RDoc recognizes a lot of features and tries it best to render them the best way it can. Additional features the developer can add include:

# *bold* to make the text inside '* *' bold  

# _italic_ to make the text inside '_ _' italicized

# +text that looks like code+ to embed the text inside '+ +'   

# Indented code will be automatically formatted

# THE NO DOC MODIFIER
# #:nodoc: next to a method named 'secrete_method to let rdoc ignore the 'secrete_method'. For example:
class MyMethods
  def public_method
  end
  
  def secrete_method #:nodoc:
  end 
end
# RDoc will take care of public_method but ignore secrete_method.
# :nodoc: only operates directly upon the elements upon which it is placed. If you want :nodoc: to apply to the current element and all those beneath it (all methods within a class, for example), do this:
class MyMethods #:nooc: all
  def public_method
  end
  
  def secrete_method
  end 
end
# This way, none of 'MyMethods' woould be documented by rdoc.

# Turning RDoc Processing On and Off
# RDoc can be turned on / off with '#--' and '#++' like so:
# This section is documented and read by rdoc
#--
# This section is hidden from rdoc and could contain developer notes, private messages between developers, etc.
#++
# RDoc begins processing again here after the '++' above.
# This feature is particularly ideal in sections where you want to leave comments to yourself that aren’t for general consumption.
# Note that RDoc doesn’t process comments that are within methods, so your usual code comments are not used in the documentation produced.

# COMMAND LINE OPTIONS
# Like most command-line applications, including Ruby itself, you can give RDoc a number of options, as follows:
# $ --all: Usually RDoc processes only public methods, but $ --all forces RDoc to document all methods within the source files.

# $ --fmt <format_name>: Produce documentation in a certain format (default is html, but xml, yaml, chm and pdf are available under some configurations).

# $ --help: Get help with using RDoc’s command-line options and find out which output formatters are available.

# $ --inline-source: Usually source code is shown using popups, but this option forces code to be shown inline with the documentation.

# $ --main <name>: Set the class, module, or file that appears as the main index page for the documentation to <name> (for example, rdoc --main MyClass).

# $ --one-file: Make RDoc place all the documentation into a single file.

# $ --op <directory_name>: Set the output directory to <directory_name> (default is doc).

# After any command-line options, rdoc is suffixed with the filename(s) of the files you want to have RDoc document. Alternatively, if you specify nothing, RDoc will traverse the current directory and all subdirectories and generate documentation for your entire project.