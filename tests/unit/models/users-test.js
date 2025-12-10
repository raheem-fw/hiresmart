import { setupTest } from 'hr-app/tests/helpers';
import { module, test } from 'qunit';

module('Unit | Model | users', function (hooks) {
  setupTest(hooks);

  // Replace this with your real tests.
  test('it exists', function (assert) {
    const store = this.owner.lookup('service:store');
    const model = store.createRecord('users', {});
    assert.ok(model, 'model exists');
  });
});
