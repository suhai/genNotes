var fs = require('fs');

class Controller {
  static sendHTML(req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    fs.readFile('./index.html', null, function (error, data) {
      if (error) {
        res.writeHead(404);
        res.write('File Not Found');
      } else {
        res.write(data);
      }
      res.end();
    });
  }
  
  static homePage(req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('<h1>Hey, this is the homepage of your server</h1>');
  }

  static welcome(req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Welcome homepage');
  }

  static errorMessage(req, res) {
    res.writeHead(404);
    res.end("Error, the URL doesn't exist");
  }
}


module.exports = Controller;