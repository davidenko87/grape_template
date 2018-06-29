module CreativeWizard
  module Config
    require 'yaml'

    ## this is needed to load in you config.yml
    CONFIG_FILE = ::File.expand_path('../../config.yml', __FILE__)
    ::YAML.load( File.open( CONFIG_FILE ) )[ENV['RACK_ENV']].each do |key, value|
      ENV[key] = ENV.fetch(key) { value.to_s }
    end

    # ActiveRecord::Base.logger.level = ((ENV['RACK_ENV'] == 'development') ? Logger::DEBUG : Logger::INFO)
    OTR::ActiveRecord.configure_from_url!(ENV['DATABASE_URL'])

  end
end
