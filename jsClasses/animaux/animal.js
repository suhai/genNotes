
const Dog = require('./dog');
const Cat = require('./cat');


const skippy = new Dog('skippy', 'brown')
console.log(skippy);
skippy.sing('in da club');
console.log(skippy.bark());

const blue = new Cat('blue', 'swy')
console.log(blue);
console.log(blue.sound());
blue.dance();