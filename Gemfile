source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'react-rails', github: 'reactjs/react-rails'
gem 'bootstrap-sass'
gem 'bourbon' #framework do SASS, animacje itd.
gem 'font-awesome-sass' #ikony
gem 'draper' #dekoratory ,więcej info na https://github.com/drapergem/draper
gem 'fog' #interfejs komunikacji z Amazon S3, tam wygodnie się trzyma np. zdjęcia https://github.com/fog/fog
gem 'simple_form' # https://github.com/plataformatec/simple_form
gem 'devise' # https://github.com/plataformatec/devise
gem 'acts_as_shopping_cart', '~> 0.2.1' #koszyk https://github.com/crowdint/acts_as_shopping_cart
gem "js-routes"
gem 'rails_admin'
gem 'paypal-express'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'rspec-rails'
  gem 'capybara'
  gem 'dotenv-rails' # przydatne do zmiennych globalnych
end

group :development do
  #gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug' #debugger
  #gem 'did_you_mean'
  #gem 'binding_of_caller'
  #gem 'better_errors'
end

group :production do
  gem 'pg'
end
