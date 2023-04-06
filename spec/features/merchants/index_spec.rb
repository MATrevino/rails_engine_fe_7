require 'rails_helper'

RSpec.describe 'Merchants Index Page' do
  describe "as a visitor to '/merchants'" do
    it 'I see a list of merchants by name, each name is a link to their merchant show page, where I see list of items that merchant sells', :vcr do
      VCR.use_cassette('rails_engine/all_merchants') do
  
        visit '/merchants'
       
        expect(page).to have_content("Merchants")
        expect(page).to have_content("Schroeder-Jerde")
        expect(page).to have_link("Schroeder-Jerde")
      end
    end
  end
end