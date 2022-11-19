# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts '====='
User.create(email: 'admin@gmail.com', password: '123456', role: 'admin' ,username: 'owner' )
puts '====='
User.create(email: 'manager@gmail.com', password: '123456',role: 'manager' ,username: 'manager' )
