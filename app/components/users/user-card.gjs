import { LinkTo } from '@ember/routing';
import { concat } from '@ember/helper';
import Component from '@glimmer/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { Button, Avatar } from 'frontile';

import DeleteUser from './delete-user';
import Card from '/app/components/common/card';

export default class UserCard extends Component {
  @service router;

  @action
  routeToEditPage() {
    this.router.transitionTo('users.edit', this.args.user);
  }

  <template>
    <Card @class="user-card">
      <div class="actions">
        <DeleteUser @user={{@user}} />
        <Button @onPress={{this.routeToEditPage}} @intent="none">
          <ion-icon name="create-outline" class="text-2xl"></ion-icon>
        </Button>
      </div>
      <Avatar
        @src={{concat "https://picsum.photos/200?id=" @user.id}}
        @size="2xl"
        @name={{concat @user.firstName " " @user.lastName}}
        class="w-[136px] h-[136px]"
      />
      <h4 class="text-base whitespace-nowrap">{{@user.firstName}}
        {{@user.lastName}}</h4>
      <span
        class="text-sm text-gray-400 truncate max-w-full"
        title={{@user.email}}
      >
        {{@user.email}}
      </span>
    </Card>
  </template>
}
