# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

ENV['RAILS_ENV'] = 'cucumber'
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../..'))

require 'cucumber/rails'
require 'cucumber/rspec/doubles'
require 'spec/support/uploadable_files'
require 'spec/support/child_finder'
require 'json_spec/cucumber'
require 'rack/test'
require 'selenium/webdriver'

puts Rails.env

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 60
  Capybara::Selenium::Driver.new(app, 
    :browser => :remote,
    :url => 'http://ec2-54-83-51-96.compute-1.amazonaws.com',
    :desired_capabilities => :firefox,
    :http_client => http_client
  )
end

Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

Capybara.run_server = true #Whether start server when testing
Capybara.default_selector = :xpath #default selector , you can change to :css
Capybara.default_wait_time = 5 #When we testing AJAX, we can set a default wait time
Capybara.ignore_hidden_elements = false #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript
Capybara.javascript_driver = :selenium #default driver when you using @javascript tag

ActionController::Base.allow_rescue = true

module UrlHelpers
  include Rails.application.routes.url_helpers
end

World(UrlHelpers)
World(UploadableFiles, ChildFinder)
