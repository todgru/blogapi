require 'rubygems'
require 'bundler/setup'

require 'json'
require 'securerandom'
require 'sinatra'
require 'sqlite3'

Dir["lib/*.rb"].each {|file| require_relative file }
