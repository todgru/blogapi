# spec/app_spec.rb
require_relative 'spec_helper'

context "blog api" do

  # Ensure our test.db is clean before each test
  before (:each) do
    DB.execute("delete from posts;")
  end
  after (:all) do
    DB.execute("delete from posts;")
  end

  let(:body){ json(last_response.body) }

  it "should not be found" do
    get '/'
    expect(last_response.status).to eq(404)
    expect(body).to eq({"error" => "Not found"})
  end

  it "GET /posts should return 200" do
    get '/posts'
    expect(last_response).to be_ok
  end

  it "POST /posts should succeed" do
    post '/posts', params={title: "foo", body: "bar"}
    expect(last_response).to be_ok
    expect(body).to eq({"success" => true})
  end

  it "POST /posts should have several entries" do
    post '/posts', params={title: "foo", body: "bar"}
    post '/posts', params={title: "baz", body: "biz"}
    get '/posts'
    expect(last_response).to be_ok
    expect(body.count).to eq(2)

    expect(body[0]["title"]).to eq("foo")
    expect(body[0]["body"]).to eq("bar")
    expect(body[0]["post_id"]).to be_kind_of(String)
    expect(body[1]["title"]).to eq("baz")
    expect(body[1]["body"]).to eq("biz")
    expect(body[1]["post_id"]).to be_kind_of(String)
  end

end

