require 'sauce_whisk'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'dotenv'

Dotenv.load

Capybara.register_driver :selenium_chrome do |app|
  Selenium::WebDriver::Chrome.driver_path = File.join(__dir__, '..', 'lib/chromedriver')
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :sauce_selenium do |app|
  capabilities = {
    platform: ENV['PLATFORM'],
    browserName: ENV['BROWSER_NAME'],
    version: ENV['VERSION']
  }

  url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip

  Capybara::Selenium::Driver.new(app,
                                 browser: :remote, url: url,
                                 desired_capabilities: capabilities)
end

Capybara.configure do |config|
  config.default_driver = ENV['PLATFORM'] ? :sauce_selenium : :selenium_chrome
  config.javascript_driver = ENV['PLATFORM'] ? :sauce_selenium : :selenium_chrome

  config.run_server = false
  config.app_host = 'https://flexmessenger.herokuapp.com'
  # Default is 3 seconds. Change this according to your network speed, if your network is very fast you can set a very samll value
  config.default_max_wait_time = 10

  # capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.before(:each) do
    Capybara.page.driver.browser.manage.window.maximize
  end

  config.after(:each) do |scenario|
    job_name = scenario.full_description
    session_id = ::Capybara.current_session.driver.browser.session_id
    ::Capybara.current_session.driver.quit

    # Output sessionId and jobname to std out for Sauce OnDemand Plugin to display embeded results
    # puts "SauceOnDemandSessionID=#{session_id} job-name=#{job_name}"

    job = SauceWhisk::Jobs.fetch session_id
    job.name = job_name
    job.save

    if scenario.exception
      SauceWhisk::Jobs.fail_job session_id
    else
      SauceWhisk::Jobs.pass_job session_id
    end
  end if ENV['PLATFORM']
end
