# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create(first_name: 'Test', last_name: 'User', username: 'testuser', password: 'testpassword', email: 'testuser@test.com')

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password: 'testpassword',
    email: Faker::Internet.email
    )
end

20.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(sentence_count=10),
    user_id: rand(1..11)
    )
end
