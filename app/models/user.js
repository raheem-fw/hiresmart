import Model, { attr } from '@ember-data/model';

export default class UsersModel extends Model {
    @attr('string') firstName;
    @attr('string') lastName;
    @attr('string') email;
    @attr('string') dateOfJoining;
    @attr('string') team;
}
