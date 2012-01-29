class Settings < Settingslogic
  private
    def self.get_source
      application_config = ::File.join( ::Rails.root, 'config', 'application.yml' )
      if ::File.exist?( application_config )
        application_config
      elsif ::Rails.env == 'test' || ::Rails.env == 'heroku'
        "#{application_config}.example"
      else
        raise "Error: Could not find a working configuration for environment: #{::Rails.env}"
      end
    end

  source    get_source
  namespace Rails.env
end

