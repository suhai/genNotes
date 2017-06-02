// INHERITANCE
// It is possible to change an object's prototype with Object.setPrototypeOf. Object.setPrototypeOf takes two arguments: the object whose prototype we want to link, and the prototype we want to link it to:
Object.setPrototypeOf(Dog.prototype, Animal.prototype)
// Like __proto__, however, using Object.setPrototypeOf comes with a performance hit because it alters an objects prototype.
// In order to efficiently manage inheritance in Javascript, it will be necessary to refrain from mutating the prototype at all.
// The workaround is to create an entirely new prototype object.
// We can use Object.create to do this:
Dog.prototype = Object.create(Animal.prototype);
// Object.create returns an entirely new object with its __proto__ set to whatever argument is passed to Object.create. We then set the object returned by Object.create to be the prototype of the child constructor function.
// This is currently the recommended way to establish prototypal inheritance in JavaScript.

function Animal (name, age, owner) {
  this.name = name;
  this.age = age;
  this.owner = owner;
};

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};

function Dog () {};
Dog.prototype = Object.create(Animal.prototype); // Dog now inherits from Animal
Dog.prototype.constructor = Dog // otherwise instances of Dog will have instance.prototype.constructor === Animal'

Dog.prototype.bark = function () {
  console.log("woof! woof!!");
};
const lisa = new Dog("Lisa");
console.log(lisa.bark()); // woof! woof!!
console.log(lisa.sayHello()); // Hello, my name is undefined
console.log(lisa.name); // undefined
// This works for the most part. However, we still have the problem that Animal wont be called when constructing a Dog instance. lisa.sayHello will run, but lisa.name will be undefined.
// To fix this we will need to make one final tweak to the Dog constructor function in the previous solution:

function Dog (name, age, coatColor) {
  // call super-constructor function on **the current `Dog` instance**.
  Animal.call(this, name, age);
  // `Dog`-specific initialization
  this.coatColor = coatColor;
}
const skippy = new Dog('Skippy', 12, 'black');
console.log(skippy); // Dog { name: 'Skippy', age: 12, owner: 'black', coatColor: 'black' }
console.log(skippy.name); // skippy
console.log(skippy.age); // 12
console.log(skippy.coatColor); // black
console.log(skippy.owner); // black. this is a bug and needs fixing.
console.log();
//-----------------------------------------------------------------------------



// The (old) Surrogate trick
// You will sometimes see older code bases manage inheritance in the following way:
function Animal (name) {
  this.name = name;
};

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};

function Dog (name, coatColor) {
  Animal.call(this, name);
  this.coatColor = coatColor;
}
// A surrogate will be used to construct `Dog.prototype`.
// A `Surrogate` instance should delegate to `Animal.prototype`.
function Surrogate () {};
Surrogate.prototype = Animal.prototype;
// Set `Dog.prototype` to a `Surrogate` instance.
Dog.prototype = new Surrogate();
const fido = new Dog("Fido", "Black");
fido.sayHello();
// Instead of using Object.create to make a new prototype object, this method uses a third class traditionally called the Surrogate.

// Surrogate.prototype is set equal to Animal.prototype so all instances of Surrogate will have a __proto__ accessor that points to Animal.prototype. This surrogate instance becomes the new Dog.prototype.



// INHERITANCE in ES2015
// ES2015 greatly simplifies JavaScript inheritance. class Dog extends Animal is the syntactic-sugar equivalent of using Object.create.
// One can access a parent classs overwritten functions using super. Within a child class's constructor function, simply call super with the necessary parameters for the base class's constructor. Less commonly, one can invoke the base-class version of an overwritten (non-constructor) function using super.methodName().
// Note the use of extends and super below.

class Bicycle {
  constructor(color, model) {
    this.color = color;
    this.model = model;
  }

  action() {
    return "rolls along";
  }
}

class RaceBicycle extends Bicycle {
  constructor(color, model, gears) {
    super(color, model);
    this.gears = gears;
  }

  action() {
    const oldAction = super.action();
    return `The ${this.color} bicycle {oldAction} at a blistering pace!`
  }
}
const tom = new RaceBicycle('blue', 'BMX', 5);
console.log(tom.action());