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
    @supplies = @cart.get_supply_list_from_cart
  end

  def create
    @cart_supply_items = @cart.get_supply_items_hash
    @donation = Donation.new(user_id: current_user.id, status: "Pledged")
    if @donation.save
      @cart_supply_items.each do |supply_item, quantity|
        @donation.donation_items.create(quantity: quantity, supply_item: supply_item, donation: @donation)
      end
      flash[:success] = "Your donation (ID#: #{@donation.id}) was recieved. Thank you!"
      DonationsMailer.donation_email({
        current_user: current_user,
        supplies: @cart.get_supply_list_from_cart,
        session: session,
        total_price: @cart.total_price,
        dashboard_url: dashboard_url}).deliver_now
      session[:cart] = {}
      redirect_to donations_path
    else
      flash.now[:warning] = "Something went wrong with your donation confirmation."
      render :new
    end
  end

end
