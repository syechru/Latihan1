# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'admin123', password_confirmation: 'admin123') if Rails.env.development?

Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'Nicole',email: 'admin123@gmail.com',password: 'password1234',password_confirmation: 'password1234')

user1.add_role(:admin)

user2 = User.create(username: 'Bruce',email: 'client@gmail.com',password: 'password1234',password_confirmation: 'password1234')

user2.add_role(:client)

# 1.upto(5) do |i|
# 	Product.create(name: "monitor #{i}",
# 								 price: 600 * i,
# 								 user: user1)
# end
# 1.upto(5) do |i|
# 	Product.create(name: "keyboard #{i}",
# 								 price: 200 * i,
# 								 user: user2)
# end

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"