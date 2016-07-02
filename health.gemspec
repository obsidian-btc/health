# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'health'
  s.version = '0.0.0.1'
  s.summary = 'health'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'developers@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/health'
  s.licenses = ['Not licensed for public use']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'
  s.bindir = 'bin'
end
