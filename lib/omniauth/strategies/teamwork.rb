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

      uid { raw_info['id'] }

      info do
        warn('DEPRECATION WARNING: avatar_url is deprecated and will be removed from version 2.0 (use image instead)')

        {
          name: "#{raw_info['first_name']} #{raw_info['last_name']}",
          email: raw_info['email_address'],
          nickname: raw_info['user_name'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          location: location,
          description: raw_info['profile_text'],
          image: raw_info['avatar_url'],
          phone: raw_info['phone_number_mobile'],
          avatar_url: raw_info['avatar_url']
        }
      end

      credentials { { token: access_token.token } }

      extra { { raw_info: raw_info } }

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def raw_info
        url = "#{access_token.response.parsed.installation.api_end_point}me.json"
        @raw_info ||= access_token.get(url).parsed.person
      end

      def location
        address = raw_info['address']
        return '' unless address['city'].present? || address['state'].present?

        "#{address['city']}, #{address['state']}"
      end
    end
  end
end
