class RailsEngineFacade

  def self.merchants
    json = RailsEngineService.all_merchants
    @merchants = json[:data].map do |merchant_data|
        Merchant.new(merchant_data)
    end
  end

  def merchant_items(merchant_id)
    json = RailsEngineService.merchant_items(merchant_id)
    @items = json.map do |item_data|
      Item.new(item_data)
    end
  end
end