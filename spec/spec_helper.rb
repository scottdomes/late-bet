require 'rspec'
require 'factory_girl'

#Set the environment to test before loading up the sinatra app for Rspec.
ENV['RACK_ENV'] = 'test'
require 'sinatra'

#Load the applications environment
require_relative '../config/environment.rb'

# Clean the database between each test run using the database cleaner
require 'database_cleaner'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.color = true
  config.tty = true
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
