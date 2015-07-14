require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10))
  user.skip_confirmation!
  user.save
end
user = User.new(
  name: 'User',
  email: 'user@example.com',
  password: 'helloworld')
user.skip_confirmation!
user.save
user = User.new(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'helloworld')
user.skip_confirmation!
user.save
users = User.all

# Create Registered Applications
20.times do
  RegisteredApplication.create(
    name: Faker::Internet.domain_word,
    url: Faker::Internet.url,
    user: users.sample)
end
ras = RegisteredApplication.all

# Create Events
event_types = Faker::Lorem.words(10)
100.times do
  Event.create(
    name: event_types.sample,
    registered_application: ras.sample)
end
events = Event.all

puts "#{users.count} Users created"
puts "#{ras.count} Registered Applications created"
puts "#{events.count} Events created"