import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { Form } from 'frontile';

export default class ClearableInput extends Component {
  @tracked formData = { searchQuery: '' };

  handleFormChange = (result) => {
    this.formData = result.data;
    this.args.handleSearch(this.formData.searchQuery);
  };

  <template>
    <div class="w-72">
      <Form
        @data={{this.formData}}
        @onSubmit={{this.handleFormChange}}
        as |form|
      >
        <form.Field @name="searchQuery" as |field|>
          <field.Input @size="sm" placeholder="Search by name">
            <:startContent>
              <ion-icon name="search-outline"></ion-icon>
            </:startContent>
          </field.Input>
        </form.Field>
      </Form>
    </div>
  </template>
}
