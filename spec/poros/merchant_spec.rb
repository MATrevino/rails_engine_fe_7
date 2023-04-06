require 'rails_helper'

RSpec.describe Merchant do
  it 'exists' do
    data = { attributes: {name: "Frank's Fruits"} }

    merchant = Merchant.new(data)

    expect(merchant).to be_a(Merchant)
    expect(merchant.name).to eq("Frank's Fruits")
  end
end