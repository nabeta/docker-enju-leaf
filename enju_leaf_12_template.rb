# application template for enju_leaf
# https://github.com/next-l/enju_leaf

gem 'enju_leaf', '~> 1.2.0'
gem 'enju_manifestation_viewer', '~> 0.2.0'
gem 'enju_circulation', '~> 0.2.0'
gem 'enju_subject', '~> 0.2.0'
gem 'enju_ndl', '~> 0.2.0'

gem 'statesman', '~> 1.3'
gem 'globalize', '~> 5.0.1'
gem 'globalize-accessors'
gem 'charlock_holmes', platforms: :mri

gem 'redis-rails'
gem 'resque', require: 'resque/server'
gem 'exception_notification', '~> 4.2'
gem 'whenever', require: false
gem 'sunspot_solr', '~> 2.2.7'
gem 'progress_bar'
gem 'non-stupid-digest-assets'
gem 'dotenv-rails', '~> 2.2'
gem 'fix_microsoft_links'
gem 'foreman', '0.82.0'
