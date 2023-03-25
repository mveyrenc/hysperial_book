const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/assets/stylesheets/**/*.css',
    './app/components/**/*',
    './config/initializers/simple_form.rb'
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ["BlinkMacSystemFont", "Avenir Next", "Avenir",
          "Nimbus Sans L", "Roboto", "Noto Sans", "Segoe UI", "Arial", "Helvetica",
          "Helvetica Neue", "sans-serif"],
        'mono': ["Consolas", "Menlo", "Monaco", "Andale Mono", "Ubuntu Mono", "monospace"]
      },
    },
  },
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require('@tailwindcss/forms')({
      strategy: 'class',
    }),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/container-queries'),
    require('daisyui'),
  ]
}
