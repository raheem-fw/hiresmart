import Component from '@glimmer/component';
import { Dropdown } from 'frontile';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class TeamsFilterComponent extends Component {
  @tracked selectedKeys = ['All Employees'];

  @action
  handleSelectionChange(keys) {
    this.selectedKeys = Array.from(keys);
    this.args.handleFilterChange(...this.selectedKeys);
  }

  get teams() {
    return [
      'All Employees',
      ...new Set(this.args.model.map((user) => user.team)),
    ];
  }

  <template>
    <div class="teams-filter flex items-center">
      <h4 class="text-gray-500">Filter by</h4>
      <Dropdown as |d|>
        <d.Trigger @intent="none" @size="sm">
          {{this.selectedKeys}}
          <ion-icon name="chevron-down-outline"></ion-icon>
        </d.Trigger>

        <d.Menu
          @selectionMode="single"
          @selectedKeys={{this.selectedKeys}}
          @onSelectionChange={{this.handleSelectionChange}}
          as |Item|
        >
          {{#each this.teams as |team|}}
            <Item @key={{team}}>
              <:default>{{team}}</:default>
            </Item>
          {{/each}}

        </d.Menu>
      </Dropdown>
    </div>
  </template>
}
