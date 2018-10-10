# The New Girl Quotes (TNGQ)

The New Girl Quotes are a wiki collaboration tool for creating public & private markdown-based wikis for your favorite quotes from the television show The New Girl.

## Project Overview

* Users can sign up for a free account by providing a user name, password and email
* Users can sign in and out of TNGQ
* Users with a standard account can create, read, update, and delete public wikis
* User roles available: admin, standard, or premium
* A development database is populated (seeded) with users and wikis
* Users can upgrade their account from a free to a paid plan
* A premium user can create private wikis
* A user can edit wikis using Markdown
* A premium user can add and remove collaborators private wikis

---

## TNGQ is built using

* Ruby  2.4.1
* Rails 5.1.2
* Bootstrap
* SQLite        - testing
* PostgreSQL    - production
* SendGrid      - email confirmation
* Devise        - user authentication
* Faker         - seeding new girl quotes

---

## To run TNGQ locally
1. Clone repository
2. Run bundle install
3. Create and migrate database using the command rake db:create then rake db:migrate
4. Start rails server using the command rails s
5. Type localhost:3000 in your internet browser


---

Enjoy
