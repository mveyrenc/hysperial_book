# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users and roles
u = User.where(email: 'hysperia@gmail.com').first_or_create!(name: 'Hysperia', password: 'password')
u.roles << [Role::SUPER_ADMIN]
u = User.where(email: 'MarmionFrancoeur@armyspy.com').first_or_create!(name: 'Marmion Francoeur', password: 'password')
u.roles << [Role::READER]
User.where(email: 'john@doe.com').first_or_create!(name: 'John Doe', password: 'password')

# Books
Book.where(kind: 'cooking').first_or_create(title: 'Cooking', position: 1)
Book.where(kind: 'health_wellness').first_or_create(title: 'Health & wellness', position: 2)
Book.where(kind: 'house_care').first_or_create(title: 'House care', position: 3)
Book.where(kind: 'fabric_art').first_or_create(title: 'Fabric art', position: 4)
