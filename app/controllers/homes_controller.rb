class HomesController < ApplicationController
  def show
    @categories = Category.all
    @donation_stats = Donation.stats
    @tweets = TwitterApi.get_tweets
  end
end
