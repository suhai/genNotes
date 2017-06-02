
class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  dance() {
    console.log(`${this.owner}'s cat is dancing`);
  }

  sound() {
    return `The ${this.name} is meowing loudly`;
  }
}

module.exports = Cat;