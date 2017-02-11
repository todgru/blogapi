# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'pry'

require_relative '../init.rb'

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end

def json arg
  JSON.parse(arg)
end
