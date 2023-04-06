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
    it 'returns all items for a merchant' do
      VCR.use_cassette('rails_engine/all_merchants') do
        merchant_id = 1
        items = RailsEngineService.merchant_items(merchant_id)

        expect(items).to be_an(Array)
        expect(items.first).to have_key(:name)
        expect(items.first).to have_key(:id)
      end
    end
  end
end