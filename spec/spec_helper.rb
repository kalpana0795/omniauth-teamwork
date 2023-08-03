require 'bundler/setup'
require 'rspec'
require 'json'

Dir[File.expand_path('./spec/fixtures/**/*', __dir__)].each { |f| require f }
