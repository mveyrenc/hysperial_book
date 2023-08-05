# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users and roles
User.where(email: 'hysperia@gmail.com').first_or_create!(name: 'Hysperia', password: 'password', role: :super_admin)
User.where(email: 'MarmionFrancoeur@armyspy.com').first_or_create!(name: 'Marmion Francoeur', password: 'password', role: :reader)
User.where(email: 'john@doe.com').first_or_create!(name: 'John Doe', password: 'password')

# Books
Book.where(title: 'Cooking').first_or_create(kind: :cooking, position: 1)
Book.where(title: 'Health & wellness').first_or_create(kind: :care, position: 2)
Book.where(title: 'House care').first_or_create(kind: :care, position: 3)
Book.where(title: 'Fabric art').first_or_create(kind: :fabric_art, position: 4)
