class PurchasesController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
  end
end
