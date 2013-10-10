require "minitest/autorun"
require "minitest/pride"
require "webmock/minitest"

require "slackbot"

describe Slackbot do

  include WebMock::API

  before do
    @subdomain = "typekit"
    @token = "hippopotamus"

    @slack = Slackbot.new(@subdomain, @token)
  end

  it "posts a message to the correct channel" do
    channel = "#dev"
    message = "Hello from slack.rb"
    endpoint = (Slackbot::REMOTE_ENDPOINT % @subdomain) + (Slackbot::REMOTE_PATH % [@token, channel])

    stub_request(:post, URI.encode(endpoint)).
      with(:body => "Hello from slack.rb", :headers => {'Accept'=>'*/*'}).
      to_return(:body => "ok")

    @slack.send channel, message
  end

end
