import { frontile } from '@frontile/theme/plugin';

export default frontile({
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
