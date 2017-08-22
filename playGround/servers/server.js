// require the http module of node.js
var http = require('http');
// require the dispatcher module
var HttpDispatcher = require('httpdispatcher');
var Controller = require('./controller');
const routes = require('./routes');

// define the port of access for your server
const PORT = 2020;
var dispatcher = new HttpDispatcher();

// bringing in the routes
dispatcher.onError(Controller.errorMessage);
for (var key in routes) {
  dispatcher.onGet(key, routes[key]);
}


// We need a function which handles requests and send response
function router(request, response) {
  try {
    // log the request on console
    console.log(request.url);
    // Dispatch
    dispatcher.dispatch(request, response);
  } catch (err) {
    console.log(err);
  }
}

// Create a server
var server = http.createServer(router);

// Start the server !
server.listen(PORT, function () {
  // Callback triggered when server is successfully listening. Hurray!
  console.log("Server listening on: http://localhost:%s", PORT);
});