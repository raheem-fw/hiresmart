import { LinkTo } from '@ember/routing';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { Button } from 'frontile';
import Menus from './menu';

export default class Sidebar extends Component {
  @tracked isExpanded = true;
  @tracked isMobileDevice = false;

  constructor() {
    super(...arguments);
    const width = window.innerWidth;
    if (width < 768) {
      this.isExpanded = false;
      this.isMobileDevice = true;
    }
  }

  @action
  toggleSidebar() {
    this.isExpanded = !this.isExpanded;
  }

  @action
  hideSidebarForMobiles() {
    if (this.isMobileDevice) {
      this.toggleSidebar();
    }
  }

  <template>
    <aside class="sidebar {{if this.isExpanded 'expanded'}}">
      <div class="menu-icon">
        {{#if this.isExpanded}}
          <h1 class="text-2xl italic font-bold">HireSmart</h1>
        {{/if}}
        <Button
          @onPress={{this.toggleSidebar}}
          type="button"
          title={{if this.isExpanded "Collapse" "Expand"}}
        >
          {{#if this.isExpanded}}
            <ion-icon name="arrow-back-circle-outline" size="large"></ion-icon>
          {{else}}
            <ion-icon name="menu" size="large"></ion-icon>
          {{/if}}
        </Button>
      </div>

      <ul class="menu-items">
        {{#each Menus as |menu|}}
          <li>
            <LinkTo
              @route={{menu.route}}
              {{on "click" this.hideSidebarForMobiles}}
            >
              <ion-icon name={{menu.iconName}} size="large"></ion-icon>
              <span class="title">{{menu.name}}</span>
            </LinkTo>
          </li>
        {{/each}}
      </ul>
    </aside>
  </template>
}
