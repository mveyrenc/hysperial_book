# Pin npm packages by running ./bin/importmap

pin "application", preload: true

## daisyui
pin "daisyui", to: "https://ga.jspm.io/npm:daisyui@2.51.4/src/index.js"
pin "camelcase-css", to: "https://ga.jspm.io/npm:camelcase-css@2.0.1/index-es5.js"
pin "color", to: "https://ga.jspm.io/npm:color@4.2.3/index.js"
pin "color-convert", to: "https://ga.jspm.io/npm:color-convert@2.0.1/index.js"
pin "color-name", to: "https://ga.jspm.io/npm:color-name@1.1.4/index.js"
pin "color-string", to: "https://ga.jspm.io/npm:color-string@1.9.1/index.js"
pin "css-selector-tokenizer", to: "https://ga.jspm.io/npm:css-selector-tokenizer@0.8.0/lib/index.js"
pin "cssesc", to: "https://ga.jspm.io/npm:cssesc@3.0.0/cssesc.js"
pin "fastparse", to: "https://ga.jspm.io/npm:fastparse@1.1.2/lib/Parser.js"
pin "is-arrayish", to: "https://ga.jspm.io/npm:is-arrayish@0.3.2/index.js"
pin "nanoid/non-secure", to: "https://ga.jspm.io/npm:nanoid@3.3.4/non-secure/index.cjs"
pin "picocolors", to: "https://ga.jspm.io/npm:picocolors@1.0.0/picocolors.browser.js"
pin "postcss", to: "https://ga.jspm.io/npm:postcss@8.4.21/lib/postcss.js"
pin "postcss-js", to: "https://ga.jspm.io/npm:postcss-js@4.0.1/index.js"
pin "simple-swizzle", to: "https://ga.jspm.io/npm:simple-swizzle@0.2.2/index.js"
pin "source-map-js", to: "https://ga.jspm.io/npm:source-map-js@1.0.2/source-map.js"
pin "tailwindcss/colors", to: "https://ga.jspm.io/npm:tailwindcss@3.2.7/colors.js"
pin "tailwindcss/plugin", to: "https://ga.jspm.io/npm:tailwindcss@3.2.7/plugin.js"

## stimulus
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

## turbo
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true

## motion
pin "@unabridged/motion", to: "https://ga.jspm.io/npm:@unabridged/motion@0.7.1/javascript/index.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4-3/app/assets/javascripts/actioncable.esm.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.7.0/dist/morphdom-esm.js"

## action text
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"

## frontend
pin_all_from "app/components", under: "components"
