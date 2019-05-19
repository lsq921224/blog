Raven.configure do |config|
  config.dsn = 'https://6e3280e1c9824c5ca8979cc1a2a5e47b:1a537dc07f08422e8b78c87b05ae5e76@sentry.io/1462816'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
