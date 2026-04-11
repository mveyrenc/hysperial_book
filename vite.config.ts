import {defineConfig} from 'vite'
import ViteRails from 'vite-plugin-rails'
import inertia from '@inertiajs/vite'
import VuePlugin from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [
    ViteRails({
      fullReload: {
        additionalPaths: ['config/routes.rb', 'app/views/**/*', 'app/business/**/*'],
      },
    }),
    inertia(),
    VuePlugin(),
  ],
  server: {
    allowedHosts: ['frontend', 'backend', 'localhost']
  }
})
