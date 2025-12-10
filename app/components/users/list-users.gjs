import Component from '@glimmer/component';
import UserCard from './user-card';
import { LinkTo } from '@ember/routing';
import { tracked } from '@glimmer/tracking';

export default class ListUsersComponent extends Component {
  get filteredUsers() {
    let data;

    // filterBy
    if (this.args.filterBy !== 'All Employees') {
      data = this.args.model.filter((user) => user.team === this.args.filterBy);
    } else {
      data = [...this.args.model];
    }
    // sortBy
    if (this.args.sortDir !== 'desc') {
      // asc
      data.sort((a, b) =>
        a[this.args.sortBy].localeCompare(b[this.args.sortBy])
      );
    } else {
      // desc
      data.sort((a, b) =>
        b[this.args.sortBy].localeCompare(a[this.args.sortBy])
      );
    }

    // searchQuery
    return this.args.searchQuery
      ? data.filter((user) => {
          const fName = user.firstName.toLowerCase();
          const lName = user.lastName.toLowerCase();
          const query = this.args.searchQuery.toLowerCase();

          return fName.includes(query) || lName.includes(query);
        })
      : data;
  }

  get isEmployeesEmpty() {
    return this.args.model.length === 0 ? true : false;
  }

  <template>
    {{#if this.filteredUsers}}
      <div class="user-list flex flex-wrap items-center">
        {{#each this.filteredUsers as |user|}}
          <UserCard @user={{user}} />
        {{/each}}
      </div>

    {{else}}
      <div class="no-data text-gray-500">
        <ion-icon name="people-outline" class="text-8xl"></ion-icon>
        {{#if this.isEmployeesEmpty}}
          <p>No users created yet. Add a new employee.</p>
        {{else}}
          <p>No results for this search. Try a different search.</p>
        {{/if}}
      </div>
    {{/if}}
  </template>
}
