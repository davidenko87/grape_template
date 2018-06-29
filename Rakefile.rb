ENV['RACK_ENV'] ||= 'development'

require 'bundler'
require 'rspec/core'
require 'rspec/core/rake_task'

load 'tasks/otr-activerecord.rake'

Bundler.require :default, ENV['RACK_ENV'].to_sym
require_relative 'api'

task :default => :spec
RSpec::Core::RakeTask.new

desc "List of API routes"

task :routes do
  GrapeTemplate::API.routes.each do |api|
    version = api.version
    description = api.description
    method = api.request_method
    path = api.path
    puts "#{version}      #{method}:   #{path}   ---- #{description}"
  end
end


namespace :db do
  # Some db tasks require your app code to be loaded; they'll expect to find it here
  task :environment do
    require_relative "app"
  end
end