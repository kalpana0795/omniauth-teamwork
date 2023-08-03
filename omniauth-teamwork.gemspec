# frozen_string_literal: true

require File.expand_path('./lib/omniauth/teamwork/version', __dir__)

Gem::Specification.new do |gem|
  gem.name           = 'omniauth-teamwork'
  gem.summary        = 'Unofficial OmniAuth strategy for Teamwork.'
  gem.description    = 'Unofficial OmniAuth strategy for Teamwork.'
  gem.authors        = ['Kalpana']
  gem.homepage       = 'https://github.com/kalpana0795/omniauth-teamwork'
  gem.license        = 'MIT'

  gem.files          = `git ls-files`.split("\n")
  gem.require_paths  = ['lib']
  gem.version        = OmniAuth::Teamwork::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2', '>= 1.2', '< 3'

  gem.add_development_dependency 'rspec', '~> 3.12'
  gem.add_development_dependency 'rake', '~> 13.0'
end
