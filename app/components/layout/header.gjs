import { Dropdown, Avatar } from 'frontile';

<template>
  <header>
    <Dropdown as |d|>
      <d.Trigger @intent="none" @size="sm">
        <Avatar @name="Mohammed Raheem" />
      </d.Trigger>

      <d.Menu as |Item|>
        <Item @key="view">
          <:start>
            <ion-icon name="log-out-outline" size="large"></ion-icon></:start>
          <:default>Logout</:default>
        </Item>
      </d.Menu>
    </Dropdown>
  </header>
</template>
