if Settings.external_services.airbrake_config[:api_key].present?
  ::Airbrake.configure do |config|
    config.api_key = Settings.external_services.airbrake_config[:api_key]
  end
end

