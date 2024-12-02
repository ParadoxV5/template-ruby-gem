# frozen_string_literal: true
source 'https://rubygems.org'
gemspec

# Development Apps
group :development do
  group :type_check do
    gem 'rbs', '~> 3.6.1', require: false
    gem 'steep', '~> 1.8.1', require: false
  end
  group :documentation do
    gem 'yard', github: 'ParadoxV5/yard', tag: 'commonmarker-1.0_1', require: false
    gem 'commonmarker', '~> 2.0.1', require: false
  end
  group :test do
    gem 'rake', '~> 13.2.1'
    gem 'minitest', '~> 5.25.1'
  end
end
