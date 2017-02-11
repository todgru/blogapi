require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'sqlite3'
# Database connection
DB = SQLite3::Database.new "blog.db"
DB.results_as_hash = true

# ensure All JSON All The Time
before do
  content_type :json
end

# handle when a route not found
not_found do
  halt 404, {error: "Not found"}.to_json
end

# Get all the blog posts
#
# @param none
# @return JSON
#
get '/posts' do
  results = DB.execute("select * from posts;")
  results.each{|r| r.delete_if{|k,v| k.is_a? Integer}}.to_json
end

# Create a blog a blog post
#
# @param [Hash] Sinatra params
# @return JSON
post '/posts' do
  begin
    DB.execute("insert into posts(title, body) values(?,?)",
              [params["title"], params["body"]])
    { success: true }.to_json
  rescue SQLite3::Exception => e
    { error: e }.to_json
  end
end

