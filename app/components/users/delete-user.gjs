import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import { on } from '@ember/modifier';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { Button, Modal } from 'frontile';

export default class DeleteUserComponent extends Component {
  @service store;
  @tracked isOpen = false;

  @action
  launchConfirm() {
    this.isOpen = !this.isOpen;
  }

  @action
  deleteUser() {
    this.args.user.deleteRecord();
  }

  @tracked isOpen = false;

  @action toggle() {
    this.isOpen = !this.isOpen;
  }

  @action
  cancelDelete() {
    this.isOpen = false;
  }

  <template>
    <Button @onPress={{this.toggle}} @intent="none">
      <ion-icon name="trash-outline" class="text-2xl"></ion-icon>
    </Button>

    <Modal @isOpen={{this.isOpen}} @onClose={{this.toggle}} as |m|>
      <m.Header class="border-b-1 border-gray-200">
        Confirm
      </m.Header>
      <m.Body>
        <p class="mb-4">
          Are you sure you want to delete this employee permanently?
        </p>
      </m.Body>
      <m.Footer @class="flex gap-2">
        <Button @onPress={{this.toggle}}>
          Cancel
        </Button>
        <Button @intent="primary" @onPress={{this.deleteUser}}>
          Confirm
        </Button>
      </m.Footer>
    </Modal>
  </template>
}
