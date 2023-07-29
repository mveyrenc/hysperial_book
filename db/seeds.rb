# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

super_admin_u = User.create!(name: 'Hysperia', email: 'hysperia@gmail.com', password: 'password')
User.create!(name: 'John Doe', email: 'john@doe.com', password: 'password')
reader_u = User.create!(name: 'Marmion Francoeur', email: 'MarmionFrancoeur@armyspy.com', password: 'password')

UsersRole.create!(user: super_admin_u, role: Role::SUPER_ADMIN)
UsersRole.create!(user: reader_u, role: Role::READER)
