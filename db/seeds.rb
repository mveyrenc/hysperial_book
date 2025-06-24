# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users and roles
admin = User.where(email: 'hysperia@gmail.com').first_or_create!(name: 'Hysperia',
                                                         password: 'password',
                                                         role: :super_admin)
User.where(email: 'jane@doe.com').first_or_create!(name: 'Jane Doe',
                                                   password: 'password',
                                                   role: :reader)
User.where(email: 'john@doe.com').first_or_create!(name: 'John Doe',
                                                   password: 'password')

# Books
cooking = Book.where(title: 'Cuisine').first_or_create!(kind: :cooking, position: 1)
health = Book.where(title: 'Santé & bien-être').first_or_create!(kind: :care, position: 2)
home_care = Book.where(title: 'Entretien de la maison').first_or_create!(kind: :care, position: 3)
fabric_art = Book.where(title: 'Art textile').first_or_create!(kind: :fabric_art, position: 4)

# ContentTagKind
ContentTagFamily.where(title: 'Ingredients', kind: :ingredient, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Saisons', kind: :season, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Occasions', kind: :occasion, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Types de plat', kind: :category, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Repas', kind: :category, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Plats', kind: :category, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Origines', kind: :geographic_area, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Régimes spéciaux', kind: :restriction, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Sources', kind: :source, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Chefs', kind: :author, book: cooking).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Auteurs', kind: :author, book: cooking).first_or_create!(created_by: admin, updated_by: admin)

ContentTagFamily.where(title: 'Problématiques', kind: :occasion, book: health).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Pour qui ?', kind: :category, book: health).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Type de soin', kind: :category, book: health).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Partie du corps', kind: :category, book: health).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Sources', kind: :source, book: health).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Auteurs', kind: :author, book: health).first_or_create!(created_by: admin, updated_by: admin)

ContentTagFamily.where(title: 'Pour quoi ?', kind: :category, book: home_care).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Propriétés', kind: :category, book: home_care).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Sources', kind: :source, book: home_care).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Auteurs', kind: :author, book: home_care).first_or_create!(created_by: admin, updated_by: admin)

ContentTagFamily.where(title: 'Saisons', kind: :season, book: fabric_art).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Sources', kind: :source, book: fabric_art).first_or_create!(created_by: admin, updated_by: admin)
ContentTagFamily.where(title: 'Designers', kind: :author, book: fabric_art).first_or_create!(created_by: admin, updated_by: admin)
