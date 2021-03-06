module OmniAuth
  module Strategies
    class Bauth < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: Rails.configuration.setting[:auth][:site],
        redirect_uri: Rails.configuration.setting[:auth][:redirect_uri]
      }

      uid do
        raw_info['id']
      end

      info do
        {
          name: raw_info['email'].split('@').first,
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/profile').parsed
      end
    end
  end
end
