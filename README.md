Sinatra
=============

Brought to you by Lighthouse Labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

Development setup
-----------------

Set up development database.

    rake db:create
    rake db:migrate

Add some initial data with FactoryGirl
    
    rake db:seed

RSPEC Testing
------------

Set up test database.

    rake db:create RACK_ENV=test
    rake db:migrate RACK_ENV=test
    rspec spec/01_user_spec.rb

USING Sass
-----------

Compiling the scss just needs the sass gem to be installed (it is now part of our Gemfile as of 2016-03-25)

Then go to the stylesheet folder and type the following:

    sass user-page.scss


