# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(username:  "Example Admin",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar", 
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Admin.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end

admins = Admin.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  admins.each { |admin| admin.users.create!(name: name, contact: contact) }
end