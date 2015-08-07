# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


skateparks = ['Tennyson', 'Cannery', 'Fremont', 'Millbrae', 'Soma']
skateparks.each {|skatepark| Skatepark.create(name: skatepark)}

users = ['Harvey', 'Ian', 'Shabazz', 'Chris']
users.each {|user| User.create(name: user, email:"#{user}@gmail.com")}


3.times do |i|
  3.times do |n|
    Favorite.create(skatepark_id: (n+1), user_id: (i+1))
  end
end