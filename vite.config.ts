import {defineConfig} from 'vite'
import ViteRails from 'vite-plugin-rails'
import VuePlugin from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [
    ViteRails({
      fullReload: {
        additionalPaths: ['config/routes.rb', 'app/views/**/*', 'app/business/**/*'],
      },
    }),
    VuePlugin(),
  ],
  server: {
    allowedHosts: ['frontend', 'backend', 'localhost']
  }
})
