import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { Dropdown } from 'frontile';
import { fn } from '@ember/helper';

export default class SelectableDropdown extends Component {
  @tracked selectedKeys = ['firstName', 'asc'];

  @action
  handleSortBy(key) {
    this.selectedKeys = [key, this.selectedKeys[1]];
    this.submitChange();
  }

  @action
  handleSortDir(key) {
    this.selectedKeys = [this.selectedKeys[0], key];
    this.submitChange();
  }

  submitChange() {
    this.args.handleSortChange(this.selectedKeys);
  }

  get value() {
    const mapping = {
      firstName: 'First Name',
      lastName: 'Last Name',
      dateOfJoining: 'Date Of Joining',
    };
    return mapping[Array.from(this.selectedKeys)[0]];
  }

  <template>
    <div class="flex items-center">
      <h4 class="text-gray-500">Sort by</h4>
      <Dropdown @closeOnItemSelect={{false}} as |d|>
        <d.Trigger @intent="none" @size="sm">
          {{this.value}}
          <ion-icon name="chevron-down-outline"></ion-icon>
        </d.Trigger>

        <d.Menu
          @selectionMode="multiple"
          @selectedKeys={{this.selectedKeys}}
          as |Item|
        >
          <Item
            @key="firstName"
            @onClick={{fn this.handleSortBy "firstName"}}
          >First Name</Item>
          <Item
            @key="lastName"
            @onClick={{fn this.handleSortBy "lastName"}}
          >Last Name</Item>
          <Item
            @key="dateOfJoining"
            @onClick={{fn this.handleSortBy "dateOfJoining"}}
            @withDivider={{true}}
          >Joining Date</Item>
          <Item
            @key="asc"
            @onClick={{fn this.handleSortDir "asc"}}
          >Ascending</Item>
          <Item
            @key="desc"
            @onClick={{fn this.handleSortDir "desc"}}
          >Descending</Item>
        </d.Menu>
      </Dropdown>
    </div>
  </template>
}
