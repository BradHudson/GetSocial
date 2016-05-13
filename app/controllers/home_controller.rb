class HomeController < ApplicationController
  def index
    @tweets = get_tweets
  end

  private

  def get_tweets
    binding.pry
    topics = ["ruby", "python"]
    begin
      client.filter(track: topics.join(",")) do |tweet|
        puts tweet.text
      end
    rescue Twitter::Error::TooManyRequests => error
      # NOTE: Your process could go to sleep for up to 15 minutes but if you
      # retry any sooner, it will almost certainly fail with the same exception.
      sleep error.rate_limit.reset_in + 1
      retry
    end
  end

  def client
   Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end