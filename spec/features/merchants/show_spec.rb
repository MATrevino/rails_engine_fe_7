require 'rails_helper'

RSpec.describe 'Merchants show Page' do
  describe "as a visitor to '/merchants/merchant_id/items'" do
    it 'I see a list of merchants by name, each name is a link to their merchant show page, where I see list of items that merchant sells', :VCR do
      VCR.use_cassette('rails_engine/first_merchant_items') do

        visit '/merchants/1/items'

        expect(current_path).to eq("/merchants/1/items")
        expect(page).to have_content("Items for Schroeder-Jerde")
        expect(page).to have_content("Item Provident At")
      end
    end
  end
end