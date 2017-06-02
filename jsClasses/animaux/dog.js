class Dog {
  constructor(name, color) {
    this.name = name;
    this.color = color;
  }

  sing(song) {
    console.log(`${this.name} is singing ${song}`);
  }

  bark() {
    return `The ${this.color} dog is barking loudly`;
  }
}

module.exports = Dog;