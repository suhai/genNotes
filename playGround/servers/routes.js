const Controller = require('./controller');

const routes = {
  '/': Controller.homePage,
  '/welcome': Controller.welcome,
  '/content' : Controller.sendHTML
};

module.exports = routes;