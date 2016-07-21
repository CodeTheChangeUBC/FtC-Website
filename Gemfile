source 'https://rubygems.org' 

# NOTE: These gems are the same (including version numbers) as are used in the rails tutorial. 
# Should anything become buggy, an update may be required. 

# Rails version
gem 'rails',                   '>= 5.0.0.rc2', '< 5.1'
gem 'bcrypt',                  '3.1.11'
# Use fake users to fill out index
gem 'faker',                   '1.6.3'
gem 'carrierwave',             '0.11.2'
gem 'mini_magick',             '4.5.1'
gem 'fog',                     '1.38.0'
# Let user index page be paginated
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
# Bootstrap gem
gem 'bootstrap-sass',          '3.3.6'
gem 'puma',                    '3.4.0'
# Use SCSS for stylesheets
gem 'sass-rails',              '5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',            '4.1.1'
# Use jquery as the JavaScript library
gem 'jquery-rails',            '4.1.1'
# Turbolinks makes following links in your web application faster. 
gem 'turbolinks',              '5.0.0.beta2'
gem 'jbuilder',                '2.4.1'
# For secure handling of Environment variables
gem 'figaro'
# Gems for user-sign in APIs
gem 'omniauth-oauth2',          '~> 1.3.1'
gem 'omniauth-facebook',        '2.0.1'
gem 'omniauth-google-oauth2'

group :development, :test do
  gem 'sqlite3', '1.3.11'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',  '9.0.0', platform: :mri
end

group :development do
  gem 'web-console',           '3.1.1'
  gem 'listen',                '3.0.7'
  # Spring speeds up development by keeping your application running in the background. 
  gem 'spring',                '1.7.1'
  gem 'spring-watcher-listen', '2.0.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg',   '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


