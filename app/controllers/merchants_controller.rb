class MerchantsController < ApplicationController
  def index
    @merchants = RailsEngineFacade.merchants
  end

  def show
    @merchants = RailsEngineFacade.merchants
    @merchant = @merchants.find do |merchant|
      merchant.id == params[:id]
    end
    @items = RailsEngineFacade.new.merchant_items(params[:id])
  end
end