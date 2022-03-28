# fronze_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 5.2.3'

# #==================================================
# # RAILS CORE
# #==================================================
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'postgresql', '~> 1.0'
gem 'pry-byebug', '~> 3.9'
gem 'puma', '~> 5.2'

# #==================================================
# # BACK-END
# #==================================================
gem 'jwt', '~> 2.2.2'
gem 'rails-i18n', '~> 5.1.1'

# #==================================================
# # Development environment
# #==================================================
group :development do
  gem 'debase', '~> 0.2.4'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rspec-rails', '~> 4.1.0'
  gem 'rubocop'
  gem 'ruby-debug-ide', '~> 0.7.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'simplecov', '~> 0.21.1', require: false
end
