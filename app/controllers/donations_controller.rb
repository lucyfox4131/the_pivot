class DonationsController < ApplicationController

  def index
    if !current_user
      flash[:info] = "Please login to see your donation history."
      redirect_to login_path
    else
      @donations = current_user.donations
    end
  end

  def show
    @donation = Donation.find(params[:id])
    if @donation.user != current_user
      flash[:info] = "No donation found."
      redirect_to root_path
    end
  end

  def new
    @cart_items = @cart.get_cart_item_list
  end

  def create
    cart_items = @cart.contents
    @donation = Donation.new(user_id: current_user.id, status: "Pledged")
    if @donation.save
      cart_items.each do |cart_item|
        @donation.create_donation_item(cart_item, @donation)
      end
      flash[:success] = "Your donation (ID#: #{@donation.id}) was received. Thank you!"
      session[:cart] = []
      redirect_to donations_path
    else
      flash.now[:warning] = "Something went wrong with your donation confirmation."
      render :new
    end
  end
end
