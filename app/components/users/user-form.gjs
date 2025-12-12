// app/components/user-form.gjs

import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { tracked } from '@glimmer/tracking';
import Changeset from 'ember-changeset';
import lookupValidator from 'ember-changeset-validations';
import UserValidations from '../../validations/user';

export default class UserForm extends Component {
  @service store;
  @service router;

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
  updateValue(event) {
    const { name, value } = event.target;
    this.changeset.set(name, value);
  }

  @action
  async saveUser(event) {
    event.preventDefault();

    await this.changeset.validate();

    if (this.changeset.isInvalid) {
      console.error('Validation failed:', this.changeset.errors);
      return;
    }

    try {
      if (this.isNewRecord) {
        const validatedData = this.changeset.changes;
        const values = {};
        validatedData.forEach((data) => {
          const { key, value } = data;
          values[key] = value;
        });

        this.store.createRecord('user', values);
      } else {
        await this.changeset.execute();
      }

      this.router.transitionTo('users');
    } catch (error) {
      console.error('Save failed:', error);
    }
  }

  <template>
    <h2>{{if @user "Edit Employee" "Add New Employee"}}</h2>

    <form {{on "submit" this.saveUser}}>
      <div class="row">
        <div class="col">
          <label htmlFor="firstName">First Name:</label>
          <input
            type="text"
            id="firstName"
            name="firstName"
            value={{this.changeset.firstName}}
            {{on "input" this.updateValue}}
          />
          {{#if this.changeset.error.firstName}}
            <p class="error">{{this.changeset.error.firstName.validation}}</p>
          {{/if}}
        </div>

        <div class="col">
          <label htmlFor="lastName">Last Name:</label>
          <input
            type="text"
            id="lastName"
            name="lastName"
            value={{this.changeset.lastName}}
            {{on "input" this.updateValue}}
          />
          {{#if this.changeset.error.lastName}}
            <p class="error">{{this.changeset.error.lastName.validation}}</p>
          {{/if}}
        </div>
      </div>

      <div class="row">
        <div class="col">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={{this.changeset.email}}
            {{on "input" this.updateValue}}
          />
          {{#if this.changeset.error.email}}
            <p class="error">{{this.changeset.error.email.validation}}</p>
          {{/if}}
        </div>

        <div class="col">
          <label htmlFor="dateOfJoining">Date Of Joining:</label>
          <input
            type="date"
            id="dateOfJoining"
            name="dateOfJoining"
            value={{this.changeset.dateOfJoining}}
            {{on "input" this.updateValue}}
          />
          {{#if this.changeset.error.dateOfJoining}}
            <p
              class="error"
            >{{this.changeset.error.dateOfJoining.validation}}</p>
          {{/if}}
        </div>
      </div>

      <div class="row">
        <div class="col">
          <label htmlFor="team">Team:</label>
          <input
            type="text"
            id="team"
            name="team"
            value={{this.changeset.team}}
            {{on "input" this.updateValue}}
          />
          {{#if this.changeset.error.team}}
            <p class="error">{{this.changeset.error.team.validation}}</p>
          {{/if}}
        </div>
        <div class="col"></div>
      </div>

      {{! Disable the button if validation has run and failed }}
      <button type="submit" disabled={{this.changeset.isInvalid}}>
        {{if @user "Update" "Submit"}}
      </button>
    </form>
  </template>
}
