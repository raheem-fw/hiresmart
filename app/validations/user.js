import {
  validatePresence,
  validateFormat,
} from 'ember-changeset-validations/validators';

export default {
  firstName: validatePresence(true),
  lastName: validatePresence(true),
  email: [
    validatePresence(true),
    validateFormat({ type: 'email' })
  ],
  dateOfJoining: validatePresence(true),
  team: validatePresence(true),
};