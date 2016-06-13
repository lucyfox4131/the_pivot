class HomesController < ApplicationController

  def show
    @categories = Category.all
    @donation_stats = Donation.stats
  end
end
