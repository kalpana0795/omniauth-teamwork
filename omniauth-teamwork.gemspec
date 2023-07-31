# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/teamwork/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "omniauth-teamwork"
  gem.summary     = %q{Unofficial OmniAuth strategy for Teamwork.}
  gem.description = %q{Unofficial OmniAuth strategy for Teamwork.}
  gem.authors     = ["Kalpana"]
  gem.homepage    = ""
  gem.license       = "MIT"

  gem.files       = `git ls-files`.split("\n")
  gem.require_paths = ["lib"]
  gem.version     = OmniAuth::Teamwork::VERSION

  gem.add_dependency 'omniauth', '~> 2.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.8'
end
