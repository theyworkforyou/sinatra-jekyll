ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sinatra/jekyll'

require 'minitest/autorun'
require 'rack/test'
