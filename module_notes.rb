puts 'Modules in ruby'
# A module basically a collection of methods and constants. It can contain a bunch of methods that can be accessed by a class or instances of a class when the module is extended or included in the class respectively. The methods in a module may be instance methods when included, or module methods when extended. A module is made is made accessible to a class using the either the 'include' key word or the 'extend' key word. The INclude key word makes INstance methods from the module avaliable to the class in which the module is included. Whereas the EXtend key word makes class
# For example, the Enumerable module is heavily used inside of ruby. It is used by the Array class, the Hash class, etc. 
# Note that 'super' can be used in modules just like in classes.
# However, unlike classes, modules cannot be instantiated. Ex.1
module AnnoyingAnimal

  def what_are_you?
    puts "I am a #{self.class}"
  end

  def sit
    puts 'chew on shoes'
  end
end
puts AnnoyingAnimal.class
puts 

class Puppy
  include AnnoyingAnimal
end
Puppy.new.what_are_you?
# Puppy.sit would give an error because 'sit' cannot be called on the class because the module methods are instance methods here; they were INcluded, not EXtended.

class Kitty
  extend AnnoyingAnimal
end
# Kitty.new.what_are_you? # would give an error because 'what_are_you?' cannot be called on an instance of the class because the module methods are class methods here;they were EXtended, not included.
Kitty.sit
puts 

# Ex.2
module Mod
  include Math
  CONST = 1
  def meth
    # some code
  end
end
puts Mod.class.inspect              # Module
puts Mod.constants.inspect          # [:CONST, :DomainError, :PI, :E]
puts Mod.instance_methods.inspect   # [:meth]
puts Mod.instance_variables.inspect # []
# puts Mod.class_methods.inspect # []
puts Mod.class_variables.inspect # []
puts Module.constants.first(4).inspect #[:Object, :Module, :Class, :BasicObject]
puts

# Ex.3
fred = Module.new do
  def meth1
    "hello"
  end
  def meth2
    "bye"
  end
end

class Dog
  # extend fred would not be valid beacause 'fred' is an undefined local variable here. It would have to extended outside the class where it is defined
end
puts Dog.extend(fred).meth1
puts Dog.include(fred).new.meth2
puts 

# EX.4
# This is just for demonstration only. Try to avoid creating global variables. 
$david = Module.new do
  def test1
    "Haaaaaleluyah"
  end
  def test2
    "Haleluya Haleluya Haleluya!!!"
  end
end

class Cat
  include $david
  extend $david
end
puts Cat.new.test1 # both instance and module methods are valid here because
puts Cat.new.test2 # $david is both extended and included in the class Cat.
puts Cat.test1 # same as above
puts Cat.test2 # same as above
puts 


# Modules can be nested
module M1
  $a = Module.nesting
  module M2
    $b = Module.nesting # returns the list of Modules nested at this point
  end
  $c = Module.nesting
end
puts $a.inspect   # [M1]
puts $b.inspect   # [M1::M2, M1]
puts $b[0].name   # M1::M2
puts $c.inspect   # [M1]
puts 

# Modules can have ancestors; ancestors include the module itself
module ModY
  include Math
  include Comparable
  prepend Enumerable
end

puts ModY.ancestors.inspect        #=> [Enumerable, Mod, Comparable, Math]
puts Math.ancestors       #=> [Math]
puts Enumerable.ancestors #=> [Enumerable]

# More info can be found at:
# https://ruby-doc.org/core-2.2.0/Module.html
# Try to read on 'prepend' vs 'extend' vs 'include'