console.log('PROMISES');

let promiseToCleanTheRoom = new Promise(function(resolve, reject) {
  //cleaning the room
  let isClean = false;

  if (isClean) {
    resolve('clean');
  } else {
    reject('not clean');
  }
});

promiseToCleanTheRoom.then(function(fromResolve) {
  console.log('the room is ' + fromResolve);
}).catch(function(fromReject){
	console.log('the room is ' + fromReject);
})
console.log();
//-----------------------------------------------------------------------------




let cleanTheRoom = function() {
  return new Promise(function(resolve, reject) {
    resolve(' Cleaned the room,');
  });
};

let removedTheGarbage = function(message) {
  return new Promise(function(resolve, reject) {
    resolve(message + ' removed the garbage,');
  });
};

let getIcecream = function(message) {
  return new Promise(function(resolve, reject) {
    resolve(message + ' got icecream.');
  });
};

cleanTheRoom()
  .then(removedTheGarbage)
  .then(getIcecream)
  .then(function(message) {
    console.log('This is the message: \n' + message);
  });
console.log();

Promise.all([cleanTheRoom(), removedTheGarbage(), getIcecream()]).then(function(){
	console.log('Everythings done..');
});

Promise.race([removedTheGarbage(), cleanTheRoom(), getIcecream()]).then(function(){
	console.log('One of them is done.. ');
});