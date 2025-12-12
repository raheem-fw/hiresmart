import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';
import config from 'hr-app/config/environment';

export default class PushService extends Service {
  @tracked isEnabled = false;

  async askPermission() {
    const permission = await Notification.requestPermission();

    return permission === 'granted';
  }

  async subscribeUser() {
    const permissionGranted = await this.askPermission();
    if (!permissionGranted) {
      console.error('Notification permission denied!');
      return;
    }

    const registration = await navigator.serviceWorker.ready;

    const subscription = await registration.pushManager.subscribe({
      userVisibleOnly: true,
      applicationServerKey: config.VAPID_PUBLIC_KEY,
    });

    await fetch('http://localhost:4000/subscribe', {
      method: 'POST',
      body: JSON.stringify(subscription),
      headers: { 'Content-Type': 'application/json' },
    });

    this.isEnabled = true;
    console.log('Subscribed to push notifications!');
  }
}
