import config from '/app/config/environment';

console.log({ config });

const swUrl = `${config.rootURL}service-worker.js`;

export default function registerSW() {
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker
      .register(swUrl)
      .then(() => {
        // console.log('Service worker registered:', reg);
      })
      .catch((err) => {
        console.error('Service worker registration failed:', err);
      });
  }
}
