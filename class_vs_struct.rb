# http://ruby-doc.org/stdlib-2.4.1/  => ruby libraries
puts  'CLASSES, OBJECTS, AND MODULES' 

# In computer programming, a library is a collection of routines that can be called by separate programs but that exist independently of those programs.

# Classes: A class is a collection of methods and data that are used as a blueprint to create multiple objects relating to that class.

# Objects: An object is a single instance of a class. An object of class        is a single person. An object of class Dog is a single dog. If you think of objects as real-life objects, a class is the classification, whereas an object is the actual object or “thing” itself.

# Global variable: A variable that can be accessed and used from anywhere within the current program.
   
# Class variable: A variable that can be accessed and used within the scope of a class and all of its child objects.
class Square
  attr_accessor :length

  def initialize(length)
    if defined?(@@number_of_squareas)
      @@number_of_squareas += 1
    else
      @@number_of_squareas = 1
    end

    @length = length
  end

  def scale_area_by(num)
    @length * @length * num
  end

  def self.test_method
    'Hello from the Sqaure class!' 
  end

  def test_method
    'Hello from an instance of the Sqaure class!' 
  end

  def self.count
    @@number_of_squareas
  end
end

a = Square.new(5)  
b = Square.new(10)
puts Square.count 
puts Square.test_method
puts a.test_method 
puts b.scale_area_by(2)
# In the above, 'count' is a class method and '@@number_of_sqaures' is a class variable. there is a class method and an instance method named 'test_method'. '@length' is an instance variable and                                         

# Instance/object variable: A variable that can be accessed and used from the scope of a single object. An object’s methods can all access that object’s object variables.

# Local variable: A variable that can only be accessed and used from the current scope.

# Encapsulation: The concept of allowing methods to have differing degrees of visibility outside of their class or associated object. This is usually attained by using 'protected' and/or 'private' in addition to the default 'public' methods. Ex.
class Person
  def a_public_method
    # code
  end

  protected
  def a_protected_method
    # code
  end

  private
  def a_private_method
    # code
  end

  def another_private_method
    # code
  end

  public
  def another_public_method
    # code
  end
end

# Another way to it is:
class Person
  def a_public_method
    # code
  end

  def a_protected_method
    # code
  end

  def a_private_method
    # code
  end

  def another_private_method
    # code
  end

  def another_public_method
    # code
  end

  protected :a_protected_method
  private :a_private_method, :another_private_method
end
# Note that the private and protected declarations need to come after the methods have been defined. This is usually done at the bottom of the class just before the 'end' statement.       
 
# Polymorphism is the concept of writing code that can work with objects of multiple types and classes at once. For example, the '+' method works for adding numbers, joining strings, and adding arrays together. What '+' does depends entirely on what type of things you’re adding together. It also onvolves the concept of methods being able to deal with different classes of data and offering a more generic implementation (as with the 'area' and 'perimeter' methods offered by the 'Square' and 'Triangle' classes). Ex.
class Animal
  attr_accessor :name 

  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def talk
    "Meaow!"
  end
end

class Dog < Animal
  def talk
    "Woof!"
  end
end

animals = [Cat.new("Kitty"), Dog.new("Skippy"), Cat.new("Tiger")]
animals.each { |animal| puts animal.talk }
# The above code would print out different sounds for the method call 'talk' based on the specific class-method from which it was called.


# Nested Classes
# In Ruby, it’s possible to define classes within other classes. These are called nested classes. Nested classes are useful when a class depends on other classes, but those classes aren’t necessarily useful anywhere else. They can also be useful when you want to separate classes into groups of classes rather than keep them all distinct. Here’s an example:
class Animal
  def self.give_me_a_sheep(name)
    Sheep.new(name)
  end

  class Goat
  end

  class Sheep
    def initialize(name)
      @name = name
    end

    Pi = 3.141592

    def what_am_i?
      "I am a #{self.class}"
    end
  end

end

a = Animal.give_me_a_sheep("Calmo")
puts a.what_am_i? # I am a Animal::Sheep
b = Animal::Sheep.new("Holiness")
puts b.what_am_i? # I am a Animal::Sheep
# Note that 'a' and 'b' are practically the same.
c = Sheep.new("Meekness")
puts c.what_am_i? # NameError: uninitialized constant Sheep
# This error results from the fact that Sheep doesn’t exist. That’s because as a nested class under Animal, it’s known as Animal::Sheep instead.
puts Animal::Sheep::Pi # This is just testing the notes below

# Scope of Costants
class Planet
  attr_accessor :radius
  MASS = 3.8 * (10**4)
  Pi = 3.141592

  def initialize(radius)
    @radius = radius
  end
  
  def self.circumference(radius)
    Pi * radius * radius
  end

  def volume
    (4/3) * (Pi * radius * radius * radius)
  end

  def density
    MASS / volume
  end
end
puts Planet.circumference(5)
puts Planet.new(5).volume
puts Planet.new(5).density
puts Planet::Pi
puts Planet::MASS
# Here, the constants 'Pi' and 'MASS' can be accessed through the Planet::Pi and Planet::MASS calls respectively. 

# Namespace: A named element of organization that keeps classes, methods, and constants from clashing.

# Module: An organizational element that collects together any number of classes, methods, and constants into a single namespace. modules look just like classes, except they are implemented with 'module' instead of 'class'. A module can contain classes, methods, constants, etc. examples of modules include the Enumerable and Comparable modules.
#NB 'require' is used to load in code from another file

# Mix-in: A module that can mix its methods in to a class to extend that class' functionality. mix-in are usually modules that get 'included' into a class whatever the current scope might be even if you are not directly within a class.

# Enumerable: A mix-in module, provided as standard with Ruby, that implements iterators and list-related methods for other classes, such as 'collect', 'map', 'min', etc. Ruby uses this module by default with the Array and Hash classes.

# Comparable: A mix-in module, provided as standard with Ruby, that implements comparison operators (such as '<', '>' and '==') on classes that implement the generic comparison operator <=>.


# USE OF SUPER (IN INHERITANCE)
class Person
  def initialize(name, age, gender)
    @name = name
    @age = age
  end

  def name
    @name.capitalize
  end
end   

class Doctor < Person
  def name
    "Dr. " + super
  end
end    
# In the above, because 'age' and 'gender' are not set as attr_accessor, neither can be accessed directly from the class without going through a method; neither can be 'set' nor called. 'name' can be accessed via the 'name_method' but it cannot be set. To make an instance variable accessible, it has to be included as an attr_reader, and to make it editable it has to be added as an attr_writer. including it as an attr_accessor makes it both readable and writeable.

# The 'super' call makes the content of the method with the same method_name from the parent class availble to the current class method from which it is called.
                      
#Structs
# A struct is a special class whose only job is to have attributes and to hold data. Simply, the Struct class builds classes to store data. Here’s a demonstration:
Person = Struct.new(:name, :age, :gender)
adam = Person.new('Adam', 25, 'male')
eve = Person.new('Eve', 35, 'female')
puts adam.age + eve.age
# the 'Person' struct is equivalent to:
class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = male
  end
end
# However, parameters are optional when initializing a struct. for example:
Goat = Struct.new(:name, :age, :color)
skippy = Goat.new # would be valid. its out puts would be #<struct Goat name=nil, age=nil, color=nil> whereas a class would require all paramters to be filled in order top be valid.
skippy.name = Skippy # <struct Goat name="Skippy", age=nil, color=nil>


# OpenStruct
# OpenStructs are similar to structs, except that they are even easier to use. They allow one to create data objects withoiut specifying the attributes and allows for the creation of attributes on the fly. For example:
require 'ostruct'
person = OpenStruct.new
person.name = 'Sam'
person.age = 25


#USING CODE FROM OTHER FILES 
# A class such as the String or Array class can be extended by adding a method to the class. The said method can then be called on objects as if they were native methods. For example, the method 'vowels' below can be called on instances of strings like:
class String
  def vowels
    self.scan(/[aeiou]/i)
  end
end
puts "mississippi".vowels.join('-') # "i-i-i-i"
puts "This is a test".vowels.join('-') # "i-i-a-e"

# load vs resuire
# 'load' requires a full filename, including the .rb suffix, whereas 'require' assumes the .rb suffix.
# Code from external files can be added to another file by loading or requiring the external file inside the other file. GFor example if a file 'a.rb' contains the code:
# puts "Hello from file A".

# Within a new file 'b.rb', the following code:
require 'a'
# puts 'Hello from file B'
require 'a'
# puts 'Hello from file B again'

# when run would output:
# 'Hello from file A'
# 'Hello from file B'
# 'Hello from file B again'

# However, when thew same code is run with 'load' like:
load 'a.rb'
# puts 'Hello from file B'
load 'a.rb'
# puts 'Hello from file B again'

# the output would be:
# 'Hello from file A'
# 'Hello from file B'
# 'Hello from file A'
# 'Hello from file B again'

# This is because with load, the code is loaded and reprocessed anew each time you use the load method, whereas with require, the external code is processed only once. One should almost always use require instead of load. Both load and require can take absolute file names. They start by looking through the current directory for the file, and then iterate through a multitude of other directoris on the hard drive to locate the file_name.rb.
# require and load both act like normal code in Ruby programs. You can put them at any point in your Ruby code and they’ll behave as if they were processed at that point. For example:

$debug_mode = 0
require $debug_mode == 0 ? "normal-classes" : "debug-classes"
# It’s an obscure example, but it checks if the global variable $debug_mode is set to 0. If it is, it requires "normal-classes", and if not, "debug-classes". This gives you the power to include a different source file dependent on the value of a variable, ideal for situations where your application has “regular” and “debug” modes. A way to load or require a collection of libraries at once is:
%w{file1 file2 file3 file4 file5 file6}.each { |file| require file }
# Note that a required file can itself contain required files. This is known as nested inclusion.