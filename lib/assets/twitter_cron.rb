require 'twitter'
require 'net/http'
require 'uri'

class TwitterCron
  def self.twittercron

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end

    tl = client.user_timeline.first

    # 詳細
    url = URI.parse('http://localhost:3000/')
    req = Net::HTTP::Post.new(url.path)
    req.set_form_data({:uuid => tl.id , :service => 'Twitter'})
    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end
  end
end



