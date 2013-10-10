require "json"
require "net/https"
require "uri"

class Slackbot

  REMOTE_ENDPOINT = "https://%s.slack.com"
  REMOTE_PATH = "/services/hooks/slackbot?token=%s&channel=%s"

  def initialize(subdomain, token)
    @endpoint = URI(REMOTE_ENDPOINT % URI.encode(subdomain))
    @token = token
  end

  def send(channel, message)
    http = Net::HTTP.new(@endpoint.host, @endpoint.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(path(channel))
    request.body = message

    http.request(request)
  end

  protected

  def path(channel)
    REMOTE_PATH % [@token, channel].map { |param| URI.encode(param) }
  end

end
