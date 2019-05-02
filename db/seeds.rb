# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding Roles table
# Role.create([{ kind: 'admin' }, { kind: 'buyer' },{ kind: 'seller' }])


#Active admin default seed
User.create!(email: 'kirakidakun123@gmail.com', password: 'password',
             password_confirmation: 'password' , role_id: 1)