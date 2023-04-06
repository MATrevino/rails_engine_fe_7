require 'rails_helper'

RSpec.describe Item do
  it 'exists' do
    item_data = {
      id: "1",
      type: "item",
      attributes: {
        name: "Item Provident At",
        description: "Nihil autem sit odio inventore deleniti. Quia voluptas doloremque quia. Quia et dolorem. Autem quia doloremque. Et et ut autem. Autem et aut.",
        unit_price: 75107,
        merchant_id: 1
      }
    }
    item = Item.new(item_data)

    expect(item).to be_a(Item)
    expect(item.id).to eq("1")
    expect(item.name).to eq("Item Provident At")
    expect(item.description).to eq("Nihil autem sit odio inventore deleniti. Quia voluptas doloremque quia. Quia et dolorem. Autem quia doloremque. Et et ut autem. Autem et aut.")
    expect(item.unit_price).to eq(75107)
    expect(item.merchant_id).to eq(1)
  end
end