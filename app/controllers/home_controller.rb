class HomeController < ApplicationController
  def index
    @tweets = get_tweets(params[:user_name])
  end

  private

  def get_tweets(user_name)
    get_all_tweets(user_name)
  end

  def get_all_tweets(user)
    options = {count: 10}
    client.user_timeline(user, options)
  end

  def client
   Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end