puts 'DEBUGGING AND ERRORS'
# Exceptions and Error Handling
# An exception is an event that occurs when an error arises within a program. An exception can cause the program to quit immediately with an error message, or can be handled by error- handling routines within the program to recover from the error in a sensible way.
# For example, a program might depend on a network connection (the Internet, for example), and if the network connection is unavailable, an error will arise when the program attempts to use the network. Rather than brusquely terminating with an obscure error mes- sage, the code can handle the exception and print a human-friendly error message to the screen first. Alternatively, the program might have a mechanism by which it can work offline, and you can use the exception raised by trying to access an inaccessible network or server to enter that mode of operation instead.

#Raising Exceptions
#In Ruby, exceptions are packaged into objects of class EXxception or one of Exception’s many subclasses. Ruby has about 30 main predefined exception classes that deal with different types of errors, such as NoMemoryErro, RunTimeError, SecurityError, ZeroDivisionError, and NoMethodError.

# When an exception is raised (exceptions are said to be raised when they occur within the execution of a program), Ruby immediately looks back up the tree of routines that called the current one (known as the stack) and looks for a routine that can handle that particular exception. If it can’t find any error-handling routines, it quits the program with the raw error message. 

# Ruby can raise exceptions automatically when you perform incorrect functions, and you can raise exceptions from your own code too. You do this with the 'raise' method and by using an existing exception class, or by creating one of your own that inherits from the 'Exception' class.
# One of the standard exception classes is ArgumentError, which is used when the arguments provided to a method are fatally flawed. You can use this class as an exception if bad data is supplied to a method of your own:
class Person
  def initialize(name)
    raise ArgumentError, "No name present" if name.empty?
  end
end
# 'ArgumentError: No name present' would be raised if an instance of a person is created without a name like : fred = Person.new('')

# Note that one can call 'raise' with no arguments at all, and a generic RuntimeError exception will be raised. This is not good practice, though, as the exception will have no message or meaning along with it. Always provide a message and a class with 'raise', if possible.

# One can also create a personalized type of exception if needed. Ex.
class BadDataException < RuntimeError
end

class Person
  def initialize(name)
    raise BadDataException, "No name present" if name.empty?
  end
end

puts 'Handling Exceptions'
# When raised, exceptions halt the execution of the program and trace their way back up the stack to find some code that can handle them. If no handler for the exception is found, the program ceases execution and dies with an error message with information about the exception. However, in most situations, stopping a program because of a single error isn’t necessary. The error might only be minor, or there might be an alternative option to try. Therefore, it’s possible to handle exceptions. In Ruby, the 'rescue' clause is used, along with 'begin' and 'end', to define blocks of code to handle exceptions. For example:
begin
  puts 10 / 0
rescue
  puts 'You caused an error!'
end

# In this case, begin and end define a section of code to be run, where if an exception arises, it’s handled with the code inside the rescue block. First, you try to work out ten divided by zero, which raises an exception of class     ZeroDivisionError. However, being inside a block containing a rescue section means that the exception is handled by the code inside that rescue section. Rather than dying with a ZeroDivisionError, the text “You caused an error!” is instead printed to the screen. This can become important in programs that rely on external sources of data. Consider this pseudo-code:
data = ''
begin
  # <..some_code_to_retrieve_data_from_a_web_page..>
  # data = <..content_of_web_page..>
rescue
  # puts 'The web page could not be loaded! using default data instead.'
  # data = <..some_data_from_a_local_file..>
end
puts data

# This code demonstrates why handling exceptions is extremely useful. If retrieving the contents of a Web page fails (if you’re not connected to the Internet, for example), then the error-handling routine rescues the exception, alerts the user of an error, and then loads up some data from a local file instead—certainly better than exiting the program immediately!
# In the previous section we looked at how to create your own exception classes, and the motivation for doing this is that it’s possible to rescue different types of exceptions in a dif- ferent way. For example, you might want to react differently if there’s a fatal flaw in the code, versus a simple error such as a lack of network connectivity. There might also be errors you want to ignore, and only specific exceptions you wish to handle.
# rescue’s syntax makes handling different exceptions in different ways easy:
begin
  # <..some_code_goes_here..>
rescue ZeroDivisionError
  # <..some_code_to_rescue_ZeroDivisionError..>
rescue NoMethodError
  # <..some_code_to_rescue_NoMethodError..>
rescue SomePersonalizedError
  # <..some_code_to_rescue_SomePersonalizedError..>
rescue SomeOtherPersonalizedError
  # <..some_code_to_rescue_SomeOtherPersonalizedError..>
rescue
  # <..some_code_to_rescue_all_other_types_of_exception..>
end

# This code contains multiple rescue blocks, each of which is caused depending on the type of exception raised. If a ZeroDivisionError is raised within the code between begin and the rescue blocks, the rescue ZeroDivisionError code is executed to handle the exception.

puts 'Handling Passed Exceptions'
# As well as handling different types of exceptions using different code blocks, it is possible to receive exceptions and use them. This is achieved with a little extra syntax on the rescue block like so:
begin
  10 / 0
rescue => e
  puts e.class
end
# The output of the above code would be ZeroDivisionError
# Rather than merely performing some code when an exception is raised, the exception object itself is assigned to the variable  , whereupon you can use that variable however you wish. This is particularly useful if the exception class contains extra functionality or attributes that you want to access.

puts 'Catch and Throw'
# Although creating your own exceptions and exception handlers are useful for resolving error situations, sometimes you want to be able to break out of a thread of execution, say a loop during normal operation in a similar way to an exception, but without actually generating an error. Ruby provides two methods 'catch' and 'throw', for this purpose.
# catch and throw work in a way a little reminiscent of raise and rescue but catch and throw work with symbols rather than exceptions. They’re designed to be used in situations where no error has occurred, but being able to escape quickly from a nested loop, method call, or similar, is necessary.
# The following example creates a block using catch. The catch block with the   :finish symbol as an argument will immediately terminate (and move on to any code after that block) if throw is called with the :finish symbol.
catch (:finish) do
  1000.times do 
    x = rand(1000)
    throw :finish if x == 999
  end

  puts 'Generated 1000 random numbers without genrating 123!'
end
# Within the catch block you generate 1,000 random numbers, and if the random number is ever 123, you immediately escape out of the block using throw :finish. However, if you manage to generate 1,000 random numbers without generating the number 123, the loop and the block complete, and you see the message.
# catch and throw don’t have to be directly in the same scope. throw works from methods called from within a catch block:
def generate_random_numbers_except_123
  x = rand(1000)
  throw :finish if x == 123
end

catch (:finish) do
  1000.times { generate_random_numbers_except_123 }
  puts 'Generated 1000 random numbers without genrating 123!'
end
# The code above operates in an identical way to the first. When throw can’t find a code block using :finsih in its current scope, it jumps back up the stack until it can.