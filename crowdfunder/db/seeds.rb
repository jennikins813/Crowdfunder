# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |i|
   Project.create(
     title: "Project#{i}",
     blurb: "Blurb#{i}",
     funding_goal: "#{i}",
     start_date: Time.now,
     end_date: Time.now,
     pledge_total: "#{i}",
     category_id: 1,
      )
end
