## Overview

This repo is a demo how to set up Sauce Labs with RSpec, Capybara with the ability to run testing either locally (on your development machine) or remotely on [Sauce Labs](https://wiki.saucelabs.com/). Many thanks to the author of repo [Ruby-RSpec-Capybara](https://github.com/saucelabs-sample-test-frameworks/Ruby-RSpec-Capybara), I reference the repo a lot and help me save quite a lot of time.
This repo has some improvements from the original repo:
  * **Add the ability to run the testing locally.** Actually this is why I start creating this repo. Mostly I would like to run the testing locally to see the result while develop testing scripts but not always to run remotely on Sauce Labs (waste of your testing time and also not convenience). You can always development the e2e testing scripts locally with the browser you preferred, once you've done the testing scripts development you can run the tests on Sauce Labs with different platforms, browsers etc.
  * **Use `dotenv` gem to manage and load the environment variables needed for testing.**

### Prerequisites

1. Environment Setup
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    	* I recommend to install Ruby with [RVM](https://rvm.io/), RVM allows you to easily install, manage, and work with multiple rubies.
    * Install bundler (Sudo may be necessary)
    ```
    $ gem install bundler
    ```
    * Install all gems with bundler
    ```
    $ bundle install
    ```

2. Sauce Credentials
    * I use gem `dotenv` to load environment variables from .env file, so you don't need to manually set the env variables on your dev machine or integration servers.
    * Login to your Sauce Labs account and get your user name and access key from your account page.
    * Copy the .env.sample as .env, and set the value for the environment variables with your credentials.

### Running Tests
* Run tests locally
```
$ rake test_locally
```

* Run tests remotely on Sauce Labs with different platforms and browsers:
```
$ rake test_sauce
```

### Advice/Troubleshooting

1. There may be additional latency when using a remote webdriver to run tests on Sauce Labs. Timeouts or Waits may need to be increased.
    * [Selenium tips regarding explicit waits](https://wiki.saucelabs.com/display/DOCS/Best+Practice%3A+Use+Explicit+Waits)

### Resources
##### [Sauce Labs Documentation](https://wiki.saucelabs.com/)

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)

##### [RSpec Documentation](http://rspec.info/documentation/)

##### [Capybara Documentation](https://github.com/jnicklas/capybara)

##### [Ruby Documentation](http://ruby-doc.org/)

##### [Stack Overflow](http://stackoverflow.com/)
