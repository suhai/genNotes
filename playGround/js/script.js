
function getWord() {
  var input = document.getElementById("some-word").value;
  document.getElementById("test").innerHTML = input;
  console.log(input);
};


// Drawing
function drawThis() {
  var c = document.getElementById("myCanvas");
  var ctx = c.getContext("2d");
  // Create gradient
  var grd = ctx.createRadialGradient(75,50,5,90,60,100);
  grd.addColorStop(0,"red");
  grd.addColorStop(1,"white");
  // Fill with gradient
  ctx.fillStyle = grd;
  ctx.fillRect(10,10,180,80);
};


// Google Map
function myMap() {
  var mapOptions = {
    center: new google.maps.LatLng(37.77, -122.41),
    // center: new google.maps.LatLng(9.40079, -0.8393),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.HYBRID
  }
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);
}
//------------------------------------------------------------------


// Geolocation 1
function getLocation1() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition1, showError1);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition1(position) {
  var x = document.getElementById("demo");
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}

function showError1(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}
//------------------------------------------------------------------

// Geolocation 2
function getLocation() {
  var x = document.getElementById("demo");
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition, showError);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  var latlon = position.coords.latitude + "," + position.coords.longitude;

  var img_url = "https://maps.googleapis.com/maps/api/staticmap?center="
  +latlon+"&zoom=14&size=400x300&sensor=false&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU";
  document.getElementById("mapholder").innerHTML = "<img src='"+img_url+"'>";
}

function showError(error) {
  var x = document.getElementById("demo");
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}


// Drag and Drop
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}


// Local Storage instead of cokkies
function localClickCounter() {
  if(typeof(Storage) !== "undefined") {
    if (localStorage.clickcount) {
        localStorage.clickcount = Number(localStorage.clickcount)+1;
    } else {
        localStorage.clickcount = 1;
    }
    document.getElementById("local-storage").innerHTML = "You have clicked the button " + localStorage.clickcount + " times.";
  } else {
    document.getElementById("local-storage").innerHTML = "Sorry, your browser does not support web storage...";
  }
}


// Session Storage instead of cokkies
function sessionClickCounter() {
  if(typeof(Storage) !== "undefined") {
    if (sessionStorage.clickcount) {
        sessionStorage.clickcount = Number(sessionStorage.clickcount)+1;
    } else {
        sessionStorage.clickcount = 1;
    }
    document.getElementById("session-storage").innerHTML = "You have clicked the button " + sessionStorage.clickcount + " times in this session.";
  } else {
    document.getElementById("session-storage").innerHTML = "Sorry, your browser does not support web storage...";
  }
}


// saving to local storage and note script
function getNote(){
  if(localStorage.getItem('note')){
    var note = localStorage.getItem('note');
  } else {
    var note = 'Go ahead and edit this note to save in local storage';
  }

  document.getElementById('note').innerHTML= note;
}

function saveNote(id){
  var note = document.getElementById('note').innerHTML;
  localStorage.setItem('note', note);
}

function clearNote(){
  localStorage.clear();
  return false;
}