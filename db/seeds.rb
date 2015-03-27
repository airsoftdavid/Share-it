# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             contact: "15555555555",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  contact = "15555555555"
  User.create!(name:  name,
               contact: contact)
end