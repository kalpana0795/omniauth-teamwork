# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Teamwork < OmniAuth::Strategies::OAuth2
      option :name, 'teamwork'

      option :client_options, {
        site: 'https://www.teamwork.com/',
        authorize_url: 'https://www.teamwork.com/launchpad/login',
        token_url: 'https://www.teamwork.com/launchpad/v1/token'
      }

      uid { raw_info.id }

      info do
        {
          email: raw_info.email_address,
          first_name: raw_info.first_name,
          last_name: raw_info.last_name,
          avatar_rl: raw_info.avatar_url
        }
      end

      credentials { { token: access_token.token } }

      extra { { raw_info: raw_info } }

      def raw_info
        url = "#{access_token.response.parsed.installation.api_end_point}me.json"
        @raw_info ||= access_token.get(url).parsed.person
      end
    end
  end
end
