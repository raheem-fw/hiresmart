import EmberRouter from '@embroider/router';
import config from 'hr-app/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('users', function () {
    this.route('new');
    this.route('edit', { path: '/edit/:user_id' });
  });
});
