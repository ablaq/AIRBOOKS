# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(user_name: "ablaq", email: "al@airbooks.com", password: "123456", address: "rue des mouches")
Book.create!(user: user, title: "la semaine de 4 heures", author: "Tim Ferris", language: "Fr", subject: "personal development", pages: 250)
Book.create!(user: user, title: "Tools of Titans", author: "Tim Ferris", language: "En", subject: "personal development", pages: 530)
Book.create!(user: user, title: "Four hours body", author: "Tim Ferris", language: "En", subject: "personal development", pages: 450)
require 'json'
require 'open-uri'

url = 'https://api.github.com/users/ssaunier'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts "#{user['name']} - #{user['bio']}"
