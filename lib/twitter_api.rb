class TwitterApi
  def self.SC_public_tweets
    client.user_timeline('StackCommerce', count: 1, exclude_replies: true, include_rts: false)
  end

  def self.get_last_25_tweets(username, replies=false, rts=false)
    tweets = client.user_timeline(username, count: 25, exclude_replies: replies, include_rts: rts)
    
    tweets.each do |tweet|
      puts tweet.text
      puts tweet.created_at
    end
  end
     
  def self.client
    @client  ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    end
  end
end
