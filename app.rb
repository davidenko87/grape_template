require_relative 'api'
require 'rack/cors'

module GrapeTemplate
  class App

    def initialize
    end

    def self.instance
      @instance ||= Rack::Builder.new do
        use Rack::Cors do
          allow do
            origins '*'
            resource '*',
              headers: :any,
              methods: [:get, :post, :put, :delete, :options]
          end
        end
        run GrapeTemplate::App.new
      end.to_app
    end

    def call(env)
      response = GrapeTemplate::API.call(env)

      if (response[1]['X-Cascade'] == 'pass')
        case response[0]
        when 400..499
          Rack::Response.new( { error_message: "Client Error",
                                error_type: "Request not available in the ::API. Request catched by ::App",
                                status_code: response[0] }.to_json, response[0],
                                'Content-Type' => 'application/json').finish
        when 500..599
          Rack::Response.new( { error_message: "Server error",
                                error_type: "Error not raised by the ::API. Error catched by ::App",
                                status_code: response[0] }.to_json, response[0],
                                'Content-Type' => 'application/json').finish
        else
          response
        end
      else
        response
      end
    end
  end
end