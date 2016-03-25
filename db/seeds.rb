require 'faker'

require 'factory_girl'
FactoryGirl.find_definitions

# Creates a single custom user with the factories/user.rb file
FactoryGirl.create :user

# Creates 100 users with Faker
100.times do User.create(
  :first_name => Faker::Name.first_name, 
  :last_name => Faker::Name.last_name,
  :username => Faker::Internet.user_name,
  :email => Faker::Internet.email
  ) 
end

