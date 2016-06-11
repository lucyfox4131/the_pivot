class DonationsController<ApplicationController

  def index
    if !current_user
      flash[:notice] = "Please login to see your donation history."
      redirect_to login_path
    else
      @donations = current_user.donations
    end
  end

  def show
    @donation = Donation.find(params[:id])
    if @donation.user != current_user
      flash[:notice] = "No donation found."
      redirect_to root_path
    end
  end

  def new
    @supplies = SupplyItem.get_supply_list_from_cart(session[:cart])
  end

  def create
    @cart_supply_items = SupplyItem.get_supply_items_from_cart(session[:cart])
    @donation = Donation.new(user_id: current_user.id, status: "Pledged")
    if @donation.save
      @cart_supply_items.each do |supply_item, quantity|
        @donation.donation_items.create(quantity: quantity, supply_item: supply_item, donation: @donation)
      end
      flash[:success] = "Your donation, ##{@donation.id}, was recieved. Thank you!"
      session[:cart] = {}
      redirect_to donations_path
    else
      flash.now[:warning] = "Something went wrong with your donation confirmation."
      render :new
    end
  end

end
