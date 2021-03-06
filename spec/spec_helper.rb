require_relative "./setup_test_database"

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rspec'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

def peep_1 
  visit('/')
  click_button('Start')
  click_button('New Peep')
  fill_in('name', with: 'Gary')
  fill_in('message', with: 'I am at work')
  click_button('Peep!')

  visit('/chitter')
end 

def peep_2
  visit('/')
  click_button('Start')
  click_button('New Peep')
  fill_in('name', with: 'Mark')
  fill_in('message', with: 'I am home')
  click_button('Peep!')

  visit('/chitter')
end 
