class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(purchases_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchases_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end
end
