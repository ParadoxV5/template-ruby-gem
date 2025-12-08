# frozen_string_literal: true

#source 'https://rubygems.org'
source 'https://gem.coop'
#source 'https://rubygems.pkg.github.com/AUTHOR'
gemspec

# Development Apps
group :development do
  group :type_check do
    gem 'rbs', '~> 3.9.5', require: false
    gem 'steep', '~> 1.10.0', require: false
  end
  group :documentation do
    gem 'yard', require: false,
      # For Commonmarker 1+ (lsegal/yard#1528)
      github: 'gjtorikian/yard', branch: 'commonmarker-onetwo-oh'
    gem 'commonmarker', '~> 2.6.0', require: false
  end
  group :test do
    gem 'rake', '~> 13.3.0'
    gem 'minitest', '~> 5.26.1'
  end
end
