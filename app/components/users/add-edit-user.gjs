import Component from '@glimmer/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { Drawer, Button, Form, Input } from 'frontile';
import Changeset from 'ember-changeset';
import lookupValidator from 'ember-changeset-validations';

import UserForm from '/app/components/users/user-form';
import UserValidations from '/app/validations/user';
import { transformDate } from '/app/helpers/utils';

export default class AddOrEditUser extends Component {
  @service router;
  @service store;
  @tracked changeset;
  isNewRecord = !this.args.user;

  constructor() {
    super(...arguments);

    let model;

    if (this.isNewRecord) {
      model = {};
    } else {
      model = this.args.user;
    }

    this.changeset = new Changeset(
      model,
      lookupValidator(UserValidations),
      UserValidations
    );
  }

  @action
  toggle() {
    this.router.transitionTo('users');
  }

  @action
  async handleFormSubmit(event) {
    Object.assign(this.changeset, {
      ...event.data,
      dateOfJoining: transformDate(event.data.dateOfJoining),
    });
    await this.changeset.validate();

    if (this.changeset.isInvalid) {
      console.error('Validation failed:', this.changeset.errors);
      return;
    }

    let finalRecord;

    try {
      if (this.isNewRecord) {
        const validatedData = this.changeset.changes;
        const values = {};
        validatedData.forEach((data) => {
          const { key, value } = data;
          values[key] = value;
        });

        finalRecord = this.store.createRecord('user', values);
      } else {
        await this.changeset.execute();
        finalRecord = this.args.user;
      }

      this.router.transitionTo('users');
    } catch (error) {
      console.error('Save failed:', error);
    }
  }

  <template>
    <Drawer @isOpen={{true}} @onClose={{this.toggle}} as |d|>
      <d.Header class="border-b border-gray-200">
        {{if @user "Edit Employee" "Add Employee"}}
      </d.Header>
      <d.Body>
        <Form
          id="employee-form"
          @onChange={{this.handleFormChange}}
          @onSubmit={{this.handleFormSubmit}}
        >
          <div class="flex flex-col gap-4">
            <Input
              @name="firstName"
              @label="First Name"
              @value={{this.changeset.firstName}}
              @errors={{this.changeset.error.firstName.validation}}
            />
            <Input
              @name="lastName"
              @label="Last Name"
              @value={{this.changeset.lastName}}
              @errors={{this.changeset.error.lastName.validation}}
            />
            <Input
              @name="email"
              @label="Email"
              @type="email"
              @value={{this.changeset.email}}
              @errors={{this.changeset.error.email.validation}}
            />
            <Input
              @name="dateOfJoining"
              @label="Date Of Joining"
              @type="date"
              @value={{this.changeset.dateOfJoining}}
              @errors={{this.changeset.error.dateOfJoining.validation}}
            />
            <Input
              @name="team"
              @label="Team"
              @value={{this.changeset.team}}
              @errors={{this.changeset.error.team.validation}}
            />
          </div>
        </Form>
      </d.Body>
      <d.Footer @class="flex gap-2">
        <Button @onPress={{this.toggle}} @intent="clear">
          Cancel
        </Button>
        <Button
          @intent="primary"
          type="submit"
          form="employee-form"
          {{!-- disabled={{this.changeset.isInvalid}} --}}
        >
          Submit
        </Button>

      </d.Footer>
    </Drawer>
  </template>
}
