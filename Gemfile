source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'rake'
gem 'devise'
gem 'pg', '0.18.4'
gem 'pundit'
gem 'rack-cors', :require => 'rack/cors'
gem 'jsonapi-resources', '0.8.1'
gem 'monadic'
gem 'json'
gem 'okcomputer'
gem 'aasm'
gem 'xeroizer'
gem 'redis'
gem 'aws-sdk'
gem 'firebase'
gem 'hamster'
gem 'globalid'
gem 'rest-client'
gem 'google-api-client'

# Job scheduling
gem 'sidekiq'
gem 'sinatra', :require => nil
gem 'clockwork'
gem 'sidekiq-unique-jobs'

# Printing
gem 'prawn'
gem 'prawn-svg'

# Mail
gem 'mailgun-ruby', require: 'mailgun'

group :development do
  gem 'spring'
  gem 'rack-livereload'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-minitest'
  gem 'httplog'
end

group :development, :staging, :test do
  gem 'zeus'
  gem 'dotenv-rails'
  gem "factory_bot_rails"
  gem 'faker'
  gem 'gist'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'hirb'
  gem 'awesome_print'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'fakeredis'
  gem 'spy'
  gem 'maxitest'
end
