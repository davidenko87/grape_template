require 'bundler'
require 'grape-swagger'
require 'grape-swagger/entity'

Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'config/initializers/config'

Dir[File.join(File.dirname(__FILE__), 'app', 'services', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', 'api', 'v1', 'helpers' ,'*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', 'api', 'v1', 'entities' ,'*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', 'api', 'v1','*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', 'models', '*.rb')].each {|file| require file }


module GrapeTemplate
  class << self
    def root(*args)
      File.expand_path(File.join(File.dirname(__FILE__), *args))
    end
  end

  class API < Grape::API
    extend Config

    prefix 'api'
    format :json

    # Version 1
    mount ::GrapeTemplate::V1::Base

    # Create swagger documentation
    add_swagger_documentation \
      base_path: '/',
      api_version: 'v1',
      info: {
        title: 'GrapeTemplate',
        description: 'template'
      }
  end
end