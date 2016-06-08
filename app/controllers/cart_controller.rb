class CartController <ApplicationController

  def create
    supply_item = SupplyItem.find(params[:supply_item][:id])
    @cart.add_cart_item(supply_item.id, params[:supply_item][:quantity])
    session[:cart] = @cart.contents
    flash[:notice] = "You added #{supply_item.supply.name}"
    redirect_to family_path(supply_item.family)
  end

  def index
    @cart_items = session[:cart]
  end

  def update

  end

  def destroy
    @cart.delete_cart_item(params[:id])
    session[:cart] = @cart.contents
    supply_name = SupplyItem.find(params[:id]).supply.name
    family = SupplyItem.find(params[:id]).family
    flash[:notice] = "Successfully deleted #{view_context.link_to(supply_name, family_path(family))} from your cart."
    redirect_to cart_index_path
  end
end
