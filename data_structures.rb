puts 'SERIALIZATION'
puts 'JSON'
# this is the process of converting a ruby (whatever language) to a format that can be saved to the hard drive for future reloading or transfer to another computer over a network.
# There are many formats of serializing or representung data, the most popular of which is JSON. JSON supports a few primitive forms of data: numbers, strings, arrays and hashes.
# You can easily serialize basic Ruby objects to a JSON string:

# exmaple1.rb
 require 'json'
{ "a" => "always",
    "b" => "be",
    "c" => "closing" }.to_json # '{"a":"always","b":"be","c":"closing"}'

JSON.parse('{"a":"always","b":"be","c":"closing"}') # {"a"=>"always", "b"=>"be", "c"=>"closing"}

# JSON doesn't know how to serialize more complicated classes though:
Cat.new("Breakfast", 8, "San Francisco").to_json #<Cat:0x007fb87c81b398>
# This iw here YAML comes to the rescue.

puts 'YAML'
# example2.rb
require 'yaml'
c = Cat.new("Breakfast", 8, "San Francisco")
#<Cat:0x007ff434926690 @age=8, @city="San Francisco", @name="Breakfast">
puts c.to_yaml #
# --- !ruby/object:Cat
# name: Breakfast
# age: 8
# city: San Francisco

serialized_cat = c.to_yaml #
# "--- !ruby/object:Cat\nname: Breakfast\nage: 8\ncity: San Francisco\n"

puts serialized_cat #
# --- !ruby/object:Cat
# name: Breakfast
# age: 8
# city: San Francisco

puts YAML::load(serialized_cat)
#<Cat:0x007ff4348098e8 @age=8, @city="San Francisco", @name="Breakfast">




# '=' does not mutate an object. it merely assigns a pointer to something in memory.
# 1
x = 4
y = x
x = 5
puts x # 5
puts y # 4


# 2
x = 10
y = x
x += 6
puts x # 16
puts y # 10


# '<<' does mutate an object. it changes whatever is in memory that the pointer it is called on points to.
# 3
x = 'John'
y = x
x << ' Bull'
puts x # 'John Bull'
puts y # 'John Bull'


# 4
x = 'John'
y = x
x += ' Bull'
puts x # 'John Bull'
puts y # 'John'
puts 


# 5
x = Array.new(3, [])
# cats = Hash.new() { [] }
x[1] << 'hi'
puts x[0] # ['hi']
puts x[1] # ['hi']
puts x[2] # ['hi']
puts 
# This creates three arrays, each of which is pointing to the same empty array. So when this empty array is mutated each of the three arrays still point to this particular mutated array.


# 6
# x = Array.new(3) { } # [nil, nil, nil] note that you can't '<<' to 'nil'
x = Array.new(3) { [] } # [[], [], []]
# cats = Hash.new { |h, k| h[k] = [] }
x[1] << 'hi' 
puts x[0] # []
puts x[1] # ['hi']
puts x[2] # []
# This creates three arrays, and the empty block is called and evaluated on each of the three arrays; thus each of the three arrays points to a distinct empty array. As such, when one of the empty arrays is mutated the other arrays still retain their pointers to their empty arrays.