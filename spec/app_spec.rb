# spec/app_spec.rb
require_relative 'spec_helper'


describe "sinatra app" do

  let(:body){ last_response.body }

  it "/" do
    get '/'
    expect(last_response.status).to eq(404) 
    expect(json(body)).to eq({"error" => "Not found"})
  end

  it "GET /posts" do
    get '/posts'
    expect(last_response).to be_ok
  end

  it "GET /posts" do
    post '/posts'
    expect(last_response).to be_ok
  end

end

