require 'omniauth/strategies/bauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bauth, client_id: Rails.configuration.setting[:auth][:app_id], client_secret: Rails.configuration.setting[:auth][:app_secret]
end

OmniAuth.config.logger = Rails.logger
