import Card from '/app/components/common/card';
import { LinkTo } from '@ember/routing';
import { Button } from 'frontile';
import Component from '@glimmer/component';

export default class WelcomeComponent extends Component {
  <template>
    <div class="welcome-card">
      <Card>
        <h4 class="text-xl">Dashboard</h4>
        <h2 class="font-bold text-2xl">Welcome to HireSmart - The HR Management
          Portal</h2>
        <p>Streamline your organizations employee records, attendance, payroll
          and HR workflows - all in one place.</p>
        <p>Your central hub for managing employee data efficiently.</p>
        <LinkTo @route="users" class="button">
          <Button @intent="primary">View Employee Details</Button>
        </LinkTo>
      </Card>
    </div>
  </template>
}
