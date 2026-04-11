import {createInertiaApp} from '@inertiajs/vue3'
import {createApp, DefineComponent, h} from 'vue'
import Buefy from 'buefy'

createInertiaApp({
  // Set default page title
  // see https://inertia-rails.dev/guide/title-and-meta
  //
  title: title => title ? `${title} - Hysperial Book` : 'HysperialBook',

  // Disable progress bar
  //
  // see https://inertia-rails.dev/guide/progress-indicators
  // progress: false,

  resolve: (name) => {

    // To use a default layout, import the Layout component
    // and use the following lines.
    // see https://inertia-rails.dev/guide/pages#default-layouts
    //
    // page.default.layout = page.default.layout || Layout

    const businessPages = import.meta.glob<DefineComponent>('../business/**/pages/*.vue', {
      eager: true,
    })
    const businessPage = businessPages[`../${name}`]
    if (!businessPage) {
      console.info(`Missing Inertia business page component: '${name}'`)
    } else {
      console.debug(`Inertia business page component found: '${name}'`)

      return businessPage
    }

    const appPages = import.meta.glob<DefineComponent>('../components/pages/**/*.vue', {
      eager: true,
    })
    const appPage = appPages[`../${name}`]
    if (!appPage) {
      console.info(`Missing Inertia page component: '${name}'`)
    } else {
      console.debug(`Inertia page component found: '${name}'`)

    }
    return appPage
  },

  setup({el, App, props, plugin}) {
    createApp({render: () => h(App, props)})
      .use(plugin)
      .use(Buefy)
      .mount(el)
  },

  defaults: {
    form: {
      forceIndicesArrayFormatInFormData: false,
    },
  },
}).catch((error) => {
  // This ensures this entrypoint is only loaded on Inertia pages
  // by checking for the presence of the root element (#app by default).
  // Feel free to remove this `catch` if you don't need it.
  if (document.getElementById("app")) {
    throw error
  } else {
    console.error(
      "Missing root element.\n\n" +
      "If you see this error, it probably means you loaded Inertia.js on non-Inertia pages.\n" +
      'Consider moving <%= vite_javascript_tag "inertia" %> to the Inertia-specific layout instead.',
    )
  }
})

