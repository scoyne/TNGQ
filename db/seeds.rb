# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create Users
    10.times do
        User.create!(
            email:      Faker::Internet.email,
            password:   Faker::Internet.password(10, 20, true)
        )
    end
    users = User.all

# Create Wikis
    100.times do
        wiki = Wiki.create!(
            user: users.sample,
            title:          Faker::NewGirl.character,
            body:           Faker::NewGirl.quote,
            private:        false
        )
    end
    wikis = Wiki.all

# Create Collaborators
    50.times do
        collaborator = Collaborator.create!(
            user: users.sample,
            wiki: wikis.sample
        )
    end
    collaborators = Collaborator.all

# Create Test Accounts    
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

    premium2 = User.create!(
        email:      'premium2@example.com',
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