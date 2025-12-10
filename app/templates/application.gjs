import Sidebar from '/app/components/layout/sidebar/sidebar';
import Header from '../components/layout/header';
import Footer from '../components/layout/footer';
import Component from '@glimmer/component';
import { service } from '@ember/service';

export default class ApplicationTemplate extends Component {
  @service push;

  constructor() {
    super(...arguments);
    this.push.subscribeUser();
  }

  <template>
    <div class="container">
      <Sidebar />
      <div class="content">
        <Header />
        <main class="main">
          {{outlet}}
        </main>
        <Footer />
      </div>
    </div>
  </template>
}
