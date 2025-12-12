import { defineConfig } from 'vite';
import { extensions, classicEmberSupport, ember } from '@embroider/vite';
import { babel } from '@rollup/plugin-babel';

export default defineConfig({
  plugins: [
    classicEmberSupport(),
    ember(),
    // extra plugins here
    babel({
      babelHelpers: 'runtime',
      extensions,
    }),
  ],
  base: process.env.NODE_ENV === 'production' ? '/hiresmart/' : '/',
  build: {
    rollupOptions: {
      input: {
        main: 'index.html',
        sw: 'service-worker.js',
      },
    },
  },
});
