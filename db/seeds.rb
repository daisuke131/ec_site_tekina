# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: "洋服")
Category.create!(name: "家電")
Category.create!(name: "ゲーム")
Category.create!(name: "スポーツ")
Category.create!(name: "レジャー")
Category.create!(name: "ホビー")
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
