# General application setup for error handling and defaults

# ensure All JSON All The Time
before do
  content_type :json
end

# handle when a route not found
not_found do
  halt 404, {error: "Not found"}.to_json
end

def uuid
  SecureRandom.uuid
end
