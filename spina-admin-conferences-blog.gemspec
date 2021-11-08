# frozen_string_literal: true

require_relative 'lib/spina/admin/conferences/blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'spina-admin-conferences-blog'
  s.version     = Spina::Admin::Conferences::Blog::VERSION
  s.authors     = ['Louis Van Steene', 'Tom Simnett']
  s.email       = ['louis@lvs.me.uk', 'tom@initforthe.com']
  s.homepage    = 'https://github.com/louis-vs/spina-admin-conferences-blog'
  s.summary     = 'Blog Engine for Spina CMS'
  s.description = 'A fork of spina-blog for Spina 2.0'
  s.license     = 'MIT'
  s.required_ruby_version = '~> 2.7'

  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/louis-vs/spina-admin-conferences-blog'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md'
  ]
  s.test_files = Dir['spec/**/*']

  s.add_runtime_dependency 'draper', '>= 3.0.0', '<= 5.0'
  s.add_runtime_dependency 'friendly_id', '~> 5.2', '>= 5.2.1'
  s.add_runtime_dependency 'kaminari', '>= 1.0.1'
  s.add_runtime_dependency 'spina', '>= 2.1.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.10', '>= 1.10.0'

  s.add_development_dependency 'capybara', '~> 3.33'
  s.add_development_dependency 'factory_bot_rails', '~> 6.2'
  s.add_development_dependency 'pg', '~> 1.2'
  s.add_development_dependency 'pry-rails', '~> 0'
  s.add_development_dependency 'puma', '~> 5.5'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.5'
  s.add_development_dependency 'rspec-rails', '~> 5.0'
  s.add_development_dependency 'rubocop-rspec', '~> 2.5'
  s.add_development_dependency 'selenium-webdriver', '~> 3.142'
  s.add_development_dependency 'simplecov', '~> 0.19'
  s.add_development_dependency 'webdrivers', '~> 4.4'
end
