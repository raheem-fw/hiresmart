
import { on } from '@ember/modifier';

<template>
    <div class="drawer">
        <div class="drawer-content">
            <div class="drawer-header">
                <button class="icon-button medium" type="button" {{on 'click' @closeDrawer}}>
                    <ion-icon name="close-outline"></ion-icon>
                </button>
            </div>
            {{yield}}
        </div>
    </div>
</template>