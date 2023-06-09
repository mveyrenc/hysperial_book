const context = require.context(".", true, /index.js$/)
context.keys().forEach((path) => {
  const mod = context(path);

  // Check whether a module has the Controller export defined
  if (!mod.Controller) return;

  // Convert path into a controller identifier:
  //   example/index.js -> example
  //   nav/user_info/index.js -> nav--user-info
  const identifier = path.replace(/^\.\//, '')
    .replace(/\/index\.js$/, '')
    .replace(/\//g, '--');

  application.register(identifier, mod.Controller);
});
