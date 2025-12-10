const { frontile } = require('@frontile/theme/plugin');

module.exports = frontile({
  defaultTheme: 'light',
  themes: {
    light: {
      colors: {
        primary: {
          DEFAULT: '#003a6b',
          500: '#003a6b',
        },
      },
    },
  },
});
