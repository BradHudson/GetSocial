class HomeController < ApplicationController
  def index
    @tweets = get_tweets(params[:user_name])
  end

  private

  def get_tweets(user_name)
    binding.pry
    get_all_tweets(user_name)
  end

  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def get_all_tweets(user)
    collect_with_max_id do |max_id|
      options = {count: 10, include_rts: true}
      options[:max_id] = max_id unless max_id.nil?
      client.user_timeline(user, options)
    end
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