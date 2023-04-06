require 'rails_helper'
require 'vcr'

RSpec.describe RailsEngineService do
  describe '.all_merchants' do
    it 'returns all merchants', :vcr do
      VCR.use_cassette('rails_engine/all_merchants') do
        merchants = RailsEngineService.all_merchants
       
        expect(merchants).to be_a(Hash)
        expect(merchants[:data]).to be_an(Array)
        expect(merchants[:data].first.keys).to eq([:id, :type, :attributes])
        expect(merchants[:data].first[:attributes].keys).to eq([:name])
      end
    end
  end

  describe '.merchant_items' do
    it 'returns all items for a merchant', :vcr do
      VCR.use_cassette('rails_engine/merchant_items') do
        merchant_id = 1
        items = RailsEngineService.merchant_items(merchant_id)

        expect(items).to be_an(Hash)
        expect(items[:data].first.keys).to eq([:id, :type, :attributes])
        expect(items[:data].first[:attributes].keys).to eq([:name, :description, :unit_price, :merchant_id])
        expect(items[:data].first[:attributes][:merchant_id]).to eq(merchant_id)
      end
    end
  end
end