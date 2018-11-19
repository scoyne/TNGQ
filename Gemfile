source 'https://rubygems.org'
 
 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '~> 5.1.2'

# Use Coffee script 
  gem 'coffee-rails'

  group :production do
    # Use pg as the production database for Active Record
    gem 'pg'
    gem 'rails_12factor'
  end
  
  group :development do
    # Use sqlite3 as the development database for Active Record
    gem 'sqlite3'
    gem 'web-console', '~> 2.0'
  end
 
 # Use Puma as the app server
  gem 'puma', '~> 3.0'

 # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5.0'

 # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
 
 # Use jquery as the JavaScript library
  gem 'jquery-rails'

 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'

 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.5'
  
  gem 'thor'
  
  group :development do
    gem 'listen', '~> 3.0.5'
  end

  group :development, :test do
    gem 'rspec-rails', '~> 3.0'
    gem 'rails-controller-testing'
  end

# Use Bootstrap to additional styling on blocipedia
  gem 'bootstrap-sass'

# Use Devise for user authentication
  gem 'devise'

# Use Pundit for user authorization
  gem 'pundit'

# Use Faker for generating seed
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  
# Use Stripe to process payments for premium upgrade payments
  gem 'stripe'

# Use Figaro to store environmental variables
  gem 'figaro'

# Use Pusher to generate a ruby interface to pusher http api for figaro
  gem 'pusher'