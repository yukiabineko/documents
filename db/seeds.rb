# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
array= [["太郎",20],["次郎",18],["三郎",15],["四郎",12],["五郎",8],["六郎",5],["七郎",1]]

6.times do |i|
    User.create!(name: array[i][0], age: array[i][1])
end    