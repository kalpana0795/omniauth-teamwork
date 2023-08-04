# OmniAuth Teamwork &nbsp;![Build Status](https://github.com/kalpana0795/omniauth-teamwork/actions/workflows/ci.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/omniauth-teamwork.svg)](https://rubygems.org/gems/omniauth-teamwork) 
This gem contains the Teamwork strategy for OmniAuth.

## Installing

Add to your `Gemfile`:
```ruby
gem 'omniauth-teamwork'
```
Then `bundle install`

## Usage

`OmniAuth::Strategies::Teamwork` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :teamwork, ENV['TEAMWORK_CLIENT_ID'], ENV['TEAMWORK_CLIENT_SECRET']
end
```

## License
Copyright (c) 2023 Kalpana, Inc. See [LICENSE](https://github.com/kalpana0795/omniauth-teamwork/blob/main/LICENSE.md) for details.
