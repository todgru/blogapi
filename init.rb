require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'sqlite3'

Dir["lib/*.rb"].each {|file| require_relative file }
