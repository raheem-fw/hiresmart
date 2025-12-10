export default {
  plugins: ['prettier-plugin-ember-template-tag'],
  singleQuote: true,
  tabWidth: 2,
  overrides: [
    {
      files: ['*.js', '*.ts', '*.cjs', '.mjs', '.cts', '.mts', '.cts'],
      options: {
        trailingComma: 'es5',
      },
    },
    {
      files: ['*.html'],
      options: {
        singleQuote: false,
      },
    },
    {
      files: ['*.json'],
      options: {
        singleQuote: false,
      },
    },
    {
      files: ['*.hbs'],
      options: {
        singleQuote: false,
      },
    },
    {
      files: ['*.gjs', '*.gts'],
      options: {
        templateSingleQuote: false,
        trailingComma: 'es5',
      },
    },
  ],
};
