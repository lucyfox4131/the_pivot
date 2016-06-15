class TwitterApi

  def self.get_tweets
    client.user_timeline("Refugees", exclude_replies: true, include_rts: false, count: 20).take(3)
  end


  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_consumer_key"]
      config.consumer_secret     = ENV["twitter_consumer_secret"]
    end
  end

end
