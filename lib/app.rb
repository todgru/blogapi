#
# Simple GET and POST API based on the Sinatra framework.
#

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
    DB.execute("insert into posts(post_id, title, body) values(?,?,?)",
              uuid, [params["title"], params["body"]])
    { success: true }.to_json
  rescue SQLite3::Exception => e
    { error: e }.to_json
  end
end

