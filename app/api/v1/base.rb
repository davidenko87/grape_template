Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].each {|file| require file }

module GrapeTemplate
  module V1
    class Base < Grape::API
      version 'v1'

      desc 'return 204 for health check',
        http_codes: {code: 204}

      get '/ping' do
        status 204 # no content
      end


      # Mount all the endpoints here
      # mount ::GrapeTemplate::V1::base

      # Handling the unkown paths
      route :any, '*path' do
        error! :not_found, 404
      end
    end
  end
end