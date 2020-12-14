class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.new
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
