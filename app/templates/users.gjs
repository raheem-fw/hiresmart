import Component from '@glimmer/component';
import TitleBar from '/app/components/common/titlebar';
import { LinkTo } from '@ember/routing';
import ListUsers from '/app/components/users/list-users';
import TeamsFilter from '/app/components/users/teams-filter';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { Button } from 'frontile';
import { service } from '@ember/service';
import SortUsers from '/app/components/users/sort-users';
import SearchUsers from '/app/components/users/search-users';

export default class Users extends Component {
  @service router;
  @tracked filterBy = 'All Employees';
  @tracked sortBy = 'firstName';
  @tracked sortDir = 'asc';
  @tracked searchQuery = '';

  @action
  filterAction(item) {
    this.filterBy = item;
  }

  @action
  showNewEmployeeForm() {
    this.router.transitionTo('users.new');
  }

  @action
  sortChange(values) {
    this.sortBy = values[0];
    this.sortDir = values[1];
  }

  @action
  handleSearch(query) {
    this.searchQuery = query;
  }

  <template>
    <div class="users">
      <TitleBar @title="Employee">
        <Button
          @intent="primary"
          @onPress={{this.showNewEmployeeForm}}
          type="button"
        >
          Add Employee
        </Button>
      </TitleBar>

      <div class="fitlers px-4 py-2 flex justify-between flex-wrap gap-4">
        <div class="flex flex-wrap white-space-nowrap gap-6">
          <TeamsFilter
            @model={{@model}}
            @handleFilterChange={{this.filterAction}}
          />

          <SortUsers @handleSortChange={{this.sortChange}} />
        </div>

        <SearchUsers @handleSearch={{this.handleSearch}} />
      </div>

      <ListUsers
        @model={{@model}}
        @filterBy={{this.filterBy}}
        @sortBy={{this.sortBy}}
        @sortDir={{this.sortDir}}
        @searchQuery={{this.searchQuery}}
      />

      {{outlet}}
    </div>
  </template>
}
