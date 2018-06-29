$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV['RACK_ENV'] ||= 'test'

require 'grape'
require 'rubygems'
require 'bundler'
require 'grape-entity'

require File.expand_path '../../api.rb', __FILE__
require File.expand_path '../../db/seeds.rb', __FILE__

# configure as you want