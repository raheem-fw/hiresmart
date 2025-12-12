import Component from '@glimmer/component';
import { action } from '@ember/object';
import { on } from '@ember/modifier';

export default class ModalComponent extends Component {
  @action
  closeModal() {
    if (this.args.onClose) {
      this.args.onClose();
    }
  }

  @action
  preventClose(event) {
    event.stopPropagation();
  }

  get isVisible() {
    return !!this.args.isOpen;
  }

  <template>
    {{#if this.isVisible}}
      <div class="modal-backdrop">
        <div class="modal-content">
          <div class="modal-header">
            {{yield to="header"}}
            {{#unless (has-block "header")}}
              <h3 class="modal-title">Modal Title</h3>
              <button
                type="button"
                class="close-button"
                {{on "click" this.closeModal}}
              >
                &times;
              </button>
            {{/unless}}
          </div>
          <div class="modal-body">
            {{yield to="body"}}

            {{#unless (has-block "body")}}
              {{yield}}
            {{/unless}}
          </div>

          <div class="modal-footer">
            {{yield to="footer"}}

            {{#unless (has-block "footer")}}
              <button
                type="button"
                class="cancel-button"
                {{on "click" this.closeModal}}
              >
                Cancel
              </button>
            {{/unless}}
          </div>
        </div>
      </div>
    {{/if}}
  </template>
}
