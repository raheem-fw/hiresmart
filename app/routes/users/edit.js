import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class UsersRoute extends Route {
  @service router;
  @service store;

  async model(params) {
    try {
      const user = await this.store.peekRecord('user', params.user_id);

      if (!user) {
        this.router.transitionTo('users');
      }
      return user;
    } catch (error) {
      this.router.transitionTo('users.index');
    }
  }
}
