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
    'github_repo'       => github,
    'changelog_uri'     => File.join(github, 'releases'),
    'bug_tracker_uri'   => File.join(github, 'issues'),
    'wiki_uri'          => File.join(github, 'wiki'),
    'funding_uri'       => "https://github.com/sponsors/#{github_account}",
    'documentation_uri' => "https://rubydoc.info/gems/#{spec.name}"
  }
  
  spec.files = Dir['**/*'].grep_v Regexp.union *%w[
    test/
    Gemfile
    rbs_collection.yaml
    Steepfile
  ]
  
  spec.required_ruby_version = ['> 3.4', '< 4.1'] # Ruby 4.0 coming soon!
  #spec.add_dependency 'dependency_gem', '~> 2.1.0'
end
