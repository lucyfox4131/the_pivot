class CartSupplyItemsController <ApplicationController

  def create
    supply_item = SupplyItem.find(params[:supply_item][:id])
    @cart.add_supply_item(supply_item.id, params[:supply_item][:quantity])
    session[:cart] = @cart.contents
    flash[:notice] = "You added #{supply_item.supply.name}"
    redirect_to root_path
  end

  def index
    @cart_items = session[:cart]
  end


end
