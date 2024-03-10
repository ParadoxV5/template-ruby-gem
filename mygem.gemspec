# frozen_string_literal: true
require_relative 'lib/mygem/version'

Gem::Specification.new do|spec|
  spec.name = 'mygem'
  spec.summary = ''
  spec.version = MyGem::VERSION
  spec.author = 'AUTHOR'
  spec.license = ''
  
  github_account = spec.author
  github = "https://github.com/#{github_account}/#{spec.name}"
  spec.metadata = {
    'homepage_uri'      => spec.homepage = github,
    'changelog_uri'     => File.join(github, 'releases'),
    'bug_tracker_uri'   => File.join(github, 'issues'),
    'wiki_uri'          => File.join(github, 'wiki'),
    'funding_uri'       => "https://github.com/sponsors/#{github_account}",
    'documentation_uri' => "https://rubydoc.info/gems/#{spec.name}"
  }
  
  spec.files = Dir['**/*']
  
  spec.required_ruby_version = '~> 3.1'
  #spec.add_dependency 'dependent_gem', '~> 2.1.0'
  spec.add_development_dependency 'rake-compiler', '~> 1.2.0'
end
