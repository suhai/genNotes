//////////////////////////////////////////////
//          Lesson 1 - JS Objects           //
//////////////////////////////////////////////

/*
// Create a JS Object
var object = {
  name: 'Adam',
  address: {
    state: 'Florida'
  }
};
// Access Object Data
var myname = object.name;
console.log(myname);
// Change Object Data
object.address.state = 'Oklahoma';
// Log the Document Object
// console.log(document) in dev tools
*/

//////////////////////////////////////////////
//         Lesson 2 - DOM Functions         //
//////////////////////////////////////////////

/*
// Create a paragraph tag 
var paragraph = document.createElement('P');
// Add text to paragraph
paragraph.textContent = 'The DOM is the bomb!';
// Add text to body
document.body.appendChild(paragraph);
*/

//////////////////////////////////////////////
//        Lesson 3 - Event Listeners        //
//////////////////////////////////////////////

/*
// Create DIV Element
var div = document.createElement('DIV');
// Add height to Element
div.style.height = '100vh';
// Append Element to DOM
document.body.appendChild(div); 
// Add Event Listener
div.addEventListener('mousemove', function(event) {
  console.log(event);
  var x = event.clientX;
  var y = event.clientY;
  div.textContent = x + ', ' + y;
  div.style.backgroundColor = 'rgb(' + x + ', ' + y + ', 100)';
});
*/


//////////////////////////////////////////////
//           Lesson 4 - Refactor            //
//////////////////////////////////////////////

// this in it current state has to be run as a script within an HTML doc
function fullScreen(element) {
  var newElement = document.createElement(element);
  newElement.style.height = '100vh';
  document.body.appendChild(newElement);
  return newElement;
}

function input(inputEvent, DOMElement, callback) {
  DOMElement.addEventListener(inputEvent, function(event) {
    var x = event.clientX;
    var y = event.clientY;
    callback(DOMElement, x, y);
  });
}

function output(element, x, y) {
  element.textContent = x + ', ' + y;
  element.style.backgroundColor = 'rgb(' + x + ', ' + y + ', 100)';
}

input('mousemove', fullScreen('DIV'), output);
// Change 'mousemove' to 'click'
// Change 'DIV' to 'MAIN'


//////////////////////////////////////////////
//   Lesson 5 - Create a Hex Clock Part 1   //
//////////////////////////////////////////////


function time() {
  var date = new Date();
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var seconds = date.getSeconds();
  var arr = [hours, minutes, seconds].map(function(num) {
    return num < 10 ? '0' + num : String(num);
  });
  hours = arr[0];
  minutes = arr[1];
  seconds = arr[2];
  
  return hours + minutes + seconds;
}

//////////////////////////////////////////////
//   Lesson 6 - Create a Hex Clock Part 2   //
//////////////////////////////////////////////

function output(time) {
  var color = '#' + time;
  document.body.bgColor = color;
  document.body.textContent = color;
  document.body.style.color = 'white';
  document.body.style.height = '100vh';
}

//////////////////////////////////////////////
//   Lesson 7 - Create a Hex Clock Part 3   //
//////////////////////////////////////////////

function startClick(callback) {
  document.body.addEventListener('dblclick', function(event) {
    callback();
  });
}

function stopClick(callback, name) {
  document.body.addEventListener('click', function(event) {
    callback(name);
  });
}

function init() {
  var tick = setInterval(function() { output(time())}, 1000);
  stopClick(clearInterval, tick);
  startClick(init);
}

init();
