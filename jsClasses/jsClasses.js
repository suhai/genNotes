console.log('CLASSES')
// something.prototype determines the prototype of objects created by new something()
// Object.getPrototypeOf(obj)is the standard ES5 function for retrieving the prototype of an object.
// obj.__proto__ is a nonstandard mechanism for retrieving the prototype of an object.
// A class is a design pattern consisting of a constructor function and an associated prototype.
// Ex.
Person = function (name, age) {
  this.name = name;
  this.age = age;
}
swy = new Person('suhai', 25);
Object.getPrototypeOf(swy); // Person {}
swy.__proto__; // Person {} 

Person.prototype.sing = function () {
  return `${this.name} is singing`;
}
Object.getPrototypeOf(swy); // Person {sing: [Function]}
swy.__proto__; // Person {sing: [Function]} 
swy.sing(); // 'suhai is singing'

// // OLD SCHOOL. Probably outdated now that classes exist in JavaScript.
// function User(name, passwordHash) {
//   if (!(this instanceof User)) {
//     return new User(name, passwordHash);
//   }
//   this.name = name;
//   this.passwordHash = passwordHash;
// }
// var x = User("baravelli", "d8b74df393528d51cd19980ae0aa028e");
// var y = new User("baravelli", "d8b74df393528d51cd19980ae0aa028e");
// x instanceof User; // true
// y instanceof User; // true


// ES2015 provides an alternative syntax for creating object-constructor functions. ES2015 lets us create classes with a more intuitive and Ruby-like syntax. Consider this example:
class Bicycle {
  constructor(model, color) {
    this.model = model;
    this.color = color;
  }

  action() {
    return "rolls along";
  }

  ride() {
    console.log(`The ${this.color} ${this.model} goes "whoosh" and ${this.action()}!`);
  }

  static parade() {
    Bicycle.funBicycles.forEach(bike => bike.ride());
  }
}
const cruiser = new Bicycle("Schwinn", "turquoise");
const salsaFargo = new Bicycle("Salsa Fargo", "burnt orange");
const flyingMerkel = new Bicycle("Flying Merkel", "green");
const bianchiVolpe = new Bicycle("Bianchi Volpe", "slate blue");
Bicycle.funBicycles = [cruiser, salsaFargo, flyingMerkel, bianchiVolpe];
Bicycle.parade();

// The turquoise Schwinn goes "whoosh" and rolls along!
// The burnt orange Salsa Fargo goes "whoosh" and rolls along!
// The green Flying Merkel goes "whoosh" and rolls along!
// The slate blue Bianci Volpe goes "whoosh" and rolls along!
// prototype methods (instance methods) are written right within the class object, as is the special constructor function that initializes a new object.
// static methods can also be defined within the class object; they mimic class methods by being called without instantiating the class.
// Classes are just sugar
// Although ES6 classes may look pretty different from ES5, they are ultimately just syntactic sugar for the same prototype-based inheritance model we already know.


console.log('NODE MODULES');
// So far, we've written all our code in a single file. We'd like to learn how to split code up in Node modules. Node is different from Ruby. In Ruby, you can do like so:

// # ./cat.rb
// class Cat
//   def meow
//     # ...
//   end
// end

// # ./dog.rb
// class Dog
//   def bark
//     # ...
//   end
// end










// // # ./animals.rb
// require_relative "cat"
// require_relative "dog"

// cat = Cat.new
// dog = Dog.new

// cat.meow
// dog.bark


// // In Node, things are a little different:
// // ./cat.js
// class Cat {
//   meow() {
//     // ...
//   }
// }
// module.exports = Cat;

// // ./dog.js
// class Dog {
//   bark() {
//     // ...
//   }
// };
// module.exports = Dog;

// // ./animals.js
// const Cat = require("./cat");
// const Dog = require("./dog");

// const cat = new Cat();
// const dog = new Dog();

// cat.meow();
// dog.bark();

// // In Detail: Exporting a Class
// // Node uses require to allow one JS file to load a second JS file. For instance, animals.js used require("./cat") to load the cat.js file.
// // When a file is required, Node loads and executes its code. Normally, required files will define classes, like cat.js and dog.js defined Cat and Dog classes.
// // That is all more or less the same as in Ruby, but note that in the JS example, we store the result of require in a variable, and we use that variable to access the module. That's because unlike Ruby's require, Node's require does not import a module's global scope:


// // DOES NOT WORK
// // ./cat.js
// class Cat {
//   // ...
// }
// // ./animals.js
// require("./cat");
// Cat //=> undefined
// // So how do we export Cat from the module file? By setting module.exports. module is a pre-defined variable set up by Node, and its exports property is returned whenever we require it from another file. Let's have a look:
// // ./silly.js
// module.exports = "THIS IS MY EXPORTED STRING";

// // ./main.js
// const silly = require("./silly");
// console.log(silly); //=> THIS IS MY EXPORTED STRING
// // Because the value of module.exports is what is returned by require, cat.js exports the Cat constructor function by setting module.exports = Cat and animals.js calls const Cat = require("./cat"); to save the Cat class to a variable to use.

// // In Detail: Loading Multiple Classes
// // The above pattern works great if each source file has a single class to export. What if we want to define many chess pieces?

// // ./lib/pieces/pawn.js
// class Pawn {};
// // ...
// module.exports = Pawn;

// // ./lib/pieces/knight.js
// class Knight {};
// // ...
// module.exports = Knight;

// // ./lib/pieces/bishop.js
// class Bishop {};
// // ...
// module.exports = Bishop;

// // ... more piece files ...

// // ./lib/chess-board.js
// const Pawn   = require("./pieces/pawn");
// const Knight = require("./pieces/knight");
// const Bishop = require("./pieces/bishop");
// // ...

// const p = new Pawn();
// const k = new Knight();
// const b = new Bishop();
// // This is kind of annoying. Anyone who wants to use all of our pieces needs to load them by hand.

// // There is a common trick. In addition, to our ./pieces/pawn.js, ./pieces/knight.js, etc., we'll define one extra file:

// // ./pieces/index.js
// module.exports = {
//   Pawn: require("./pawn"),
//   Knight: require("./knight"),
//   Bishop: require("./bishop"),
//   // ...
// };

// // chess-board.js
// const Pieces = require("./pieces");

// const p = new Pieces.Pawn();
// const k = new Pieces.Knight();
// const b = new Pieces.Bishop();
// // When we require("./pieces"), Node will realize that ./pieces is a directory, not a file. Node will look for a file named index.js in ./pieces and load it. The code we wrote in ./pieces/index.js loads more files, and exports all the classes grouped in a single object. In chess-board.js, we assign this to the variable Pieces. Sometimes we call Pieces a namespace.
// // Node sets module.exports to a blank object by default. So we could rewrite the above as:
// // ./pieces/index.js
// module.exports.Pawn   = require("./pawn");
// module.exports.Knight = require("./knight");
// module.exports.Bishop = require("./bishop");
// // ...
// // I like our way of reassigning the whole module.exports better. But this way would also work.