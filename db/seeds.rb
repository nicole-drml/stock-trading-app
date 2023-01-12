# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create(email: "admin@stock.com",
#  password: "admin",
#  password_confirmation: "admin",
#  role: User.roles[:admin])
# end

User.create(email: 'trader@buzz.com', password: 'password', password_confirmation: 'password', role: 'trader')
User.create(email: 'admin@buzz.com', password: 'password', password_confirmation: 'password', role: 'admin')

User.update(email: 'trader@buzz.com', role: 'trader', first_name: 'joe', last_name: 'trader')
User.update(email: 'admin@buzz.com', role: 'admin', first_name: 'jane', last_name: 'admin')