class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
    @items = @search.result
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    unless @item.purchase.blank? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
