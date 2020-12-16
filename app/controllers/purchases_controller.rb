class PurchasesController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(purchases_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchases_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
