class MerchantsController < ApplicationController
  def index
    @merchants = RailsEngineFacade.merchants
  end

  def show
    # @merchant = RailsEngineFacade.new.merchant(params[:id])
    # @items = RailsEngineFacade.new.merchant_items(params[:id])
  end
end