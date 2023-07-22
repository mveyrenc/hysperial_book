# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

super_admin_r = Role.create!(name: :super_admin, title: 'Super admin')
Role.create!(name: :admin, title: 'Admin')
Role.create!(name: :contributor, title: 'Contributor')
reader_r = Role.create!(name: :reader, title: 'Reader')

super_admin_u = Users.create!(name: 'Hysperia', email: 'hysperia@gmail.com', password: 'password')
Users.create!(name: 'John Doe', email: 'john@doe.com', password: 'password')
reader_u = Users.create!(name: 'Marmion Francoeur', email: 'MarmionFrancoeur@armyspy.com', password: 'password')

UsersRole.create!(user: super_admin_u, role: super_admin_r)
UsersRole.create!(user: reader_u, role: reader_r)
