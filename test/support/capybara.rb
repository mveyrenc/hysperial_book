# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/cuprite'

Capybara.default_max_wait_time = 5

# disable CSS transitions and jQuery animations
Capybara.disable_animation = true

Capybara.register_driver(:my_cuprite) do |app|
  Capybara::Cuprite::Driver.new(app,
                                browser_path: '/usr/bin/chromium',
                                browser_options: {
                                  'no-sandbox': true,
                                  'disable-dev-shm-usage': true,
                                  'disable-gpu': true
                                },
                                headless: true,
                                slowmo: 5,
                                process_timeout: 15,
                                js_errors: true,
                                window_size: [1920, 1080])
end
Capybara.default_driver = :my_cuprite
Capybara.javascript_driver = :my_cuprite

# default_driver = :chrome_headless
# Capybara.register_driver default_driver do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument('--headless')
#   options.add_argument('--no-sandbox')
#   options.add_argument('--disable-dev-shm-usage')
#   options.add_argument('--disable-gpu')
#   options.add_argument('--window-size=1280,960')
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: 'ALL'})
#   Capybara::Selenium::Driver.new(app,
#                                  browser: :chrome,
#                                  options: options,
#                                  desired_capabilities: capabilities)
# end
# Capybara.default_driver = default_driver
# Capybara.javascript_driver = default_driver

# Capybara.register_driver :headless_chrome do |app|
#   caps = Selenium::WebDriver::Remote::Capabilities.merge!('goog:loggingPrefs': {
#     browser: 'ALL', client: 'ALL', driver: 'ALL', server: 'ALL'
#   })
#
#   opts = Selenium::WebDriver::Chrome::Options.new
#   chrome_args = %w(--headless --window-size=1920,1080 --no-sandbox --disable-dev-shm-usage --enable-logging
#     --verbose --log-path=$APP_DIR/log/chrome-logging.log)
#   chrome_args.each {|a| opts.add_argument a}
#
#   Capybara::Selenium::Driver.new app, browser: :chrome, options: opts, desired_capabilities: caps
# end
#
# Capybara.default_driver = :headless_chrome

# Capybara.register_driver :remote_selenium do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument('--window-size=1920,1080')
#   options.add_argument('--no-sandbox')
#   options.add_argument('--disable-dev-shm-usage')
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: "http://selenium:4444/wd/hub",
#     options:
#   )
# end
#
# Capybara.register_driver :remote_selenium_headless do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument('--headless=new')
#   options.add_argument('--window-size=1920,1080')
#   options.add_argument('--no-sandbox')
#   options.add_argument('--disable-dev-shm-usage')
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: "http://selenium:4444/wd/hub",
#     options:
#   )
# end
#
# Capybara.default_max_wait_time = 5
# Capybara.match = :prefer_exact
#
# Capybara.default_driver = :remote_browser
# Capybara.app_host = "http://web:3000"
