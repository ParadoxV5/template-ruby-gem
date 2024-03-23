# frozen_string_literal: true
source 'https://rubygems.org'
gemspec

# Development Apps
group :development do
  group :type_check do
    gem 'rbs', '~> 3.4.4', require: false
    gem 'steep', '~> 1.6.0', require: false
  end
  group :documentation do
    gem 'yard', github: 'ParadoxV5/yard', tag: 'commonmarker-1.0_1', require: false
    gem 'commonmarker', '~> 1.0.4', require: false
  end
  group :test do
    gem 'rake', '~> 13.1.0'
    gem 'minitest', '~> 5.22.2'
  end
end
