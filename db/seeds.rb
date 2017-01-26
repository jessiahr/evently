# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

org1 = Organization.create(name: 'Google')
org2 = Organization.create(name: 'Yahoo')

15.times do
  Event.create(organization_id: org1.id, message: 'A sample event', hostname: "google.com")
end
