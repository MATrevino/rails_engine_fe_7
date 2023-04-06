require 'rails_helper'

RSpec.describe 'Merchants Index Page' do
  describe "as a visitor to '/merchants'" do
    it 'I see a list of merchants by name, each name is a link to their merchant show page, where I see list of items that merchant sells', :vcr do
      merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      merchant_2 = Merchant.create!(name: 'Brians Dog Shampoo', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      item1 = create(:item, name: "Orange Jam", unit_price: 3.00, merchant_id: merchant_1.id)
      item2 = create(:item, name: "Mixed Berry Jam", unit_price: 10.50, merchant_id: merchant_1.id)
      item3 = create(:item, name: "Dry Dog Shampoo", unit_price: 1.00, merchant_id: merchant_2.id)
  
      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_link(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_link(merchant_2.name)
    end
  end
end