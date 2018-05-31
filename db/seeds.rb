# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create User
    10.times do
        User.create!(
            email:      Faker::Internet.email,
            password:   Faker::Internet.password(10, 20, true)
        )
    end
    users = User.all

    100.times do
        wiki = Wiki.create!(
            user: users.sample,
            title:      Faker::NewGirl.character,
            body:       Faker::NewGirl.quote
        )
    end
    wikis = Wiki.all

    admin = User.create!(
        email:      'admin@example.com',
        password:   'helloworld',
        role:       'admin'
    )

    premium = User.create!(
        email:      'premium@example.com',
        password:   'helloworld',
        role:       'premium'
    ) 

    standard = User.create!(
        email:      'standard@example.com',
        password:   'helloworld',
        role:       'standard'
    )

    puts 'Seed finished'
    puts "#{User.count} users created"
    puts "#{Wiki.count} wikis created"