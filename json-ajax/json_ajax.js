/* json and ajax: MY NOTES */
var counter = 1;
var contentContainer = document.getElementById("content");
var ajaxbtn = document.getElementById("ajaxbtn");
var resetbtn = document.getElementById("reset-btn");

resetbtn.addEventListener("click", function() {
  ajaxbtn.classList.remove("hide-me");
  $('#content').empty();
  counter = 1;
});

ajaxbtn.addEventListener("click", function() {
  var myRequest = new XMLHttpRequest();
  myRequest.open('GET', 'https://learnwebcode.github.io/json-example/animals-' + counter + '.json');
  myRequest.onload = function() {
    if (myRequest.status >= 200 && myRequest.status < 400) {
      var myData = JSON.parse(myRequest.responseText);
      renderHTML(myData);
    } else {
      console.log("Error Message");
    }
    
  };

  myRequest.onerror = function() {
    console.log("Connection Error");
  };

  myRequest.send();
  counter++;
  if (counter > 3) {
    ajaxbtn.classList.add("hide-me");
  }
});

function renderHTML(data) {
  var paragraphToDisplay = "";

  for (var i = 0; i < data.length; i++) {
    paragraphToDisplay += "<p>" + data[i].name + " is a " + data[i].species + " that likes to eat ";
    
    for (var j = 0; j < data[i].foods.likes.length; j++) {
      if (j == 0) {
        paragraphToDisplay += data[i].foods.likes[j];
      } else {
        paragraphToDisplay += " and " + data[i].foods.likes[j];
      }
    }

    paragraphToDisplay += ' and dislikes ';

    for (var k = 0; k < data[i].foods.dislikes.length; k++) {
      if (k == 0) {
        paragraphToDisplay += data[i].foods.dislikes[k];
      } else {
        paragraphToDisplay += " and " + data[i].foods.dislikes[k];
      }
    }

    paragraphToDisplay += '.</p>';

  }

  paragraphToDisplay += ' <br/> <br/>';

  contentContainer.insertAdjacentHTML('beforeend', paragraphToDisplay);
}

