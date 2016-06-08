class CartSupplyItemsController <ApplicationController

  def create
    byebug
    supply_item = SupplyItem.find(params[:supply_item_id])
    flash[:notice] = "You added #{supply_item.name}"
    redirect_to root_path
  end


end
