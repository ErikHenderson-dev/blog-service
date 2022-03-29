# fronze_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1'

# rails gems
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 5.2'
# gem 'rails-i18n', '~> 5.1.1'

# project gems
gem 'jwt', '~> 2.2.2'
gem 'listen', '~> 3.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'postgresql', '~> 1.0'

group :development do
  # rails gems
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # project gems
  gem 'rubocop'
end

group :development, :test do
  # rails gems
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # projetct gems
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  # gem 'debase', '~> 0.2.4'
  # gem 'ruby-debug-ide', '~> 0.7.2'

  # pry gems
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'simplecov', '~> 0.21.1', require: false
end
