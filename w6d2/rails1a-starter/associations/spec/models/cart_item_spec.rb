# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  dish_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject(:cart_item) { CartItem.first }

  it "is associated with a cart" do
    expect(cart_item.cart.id).to eq(cart_item.cart_id)
  end

  it "is associated with a dish" do
    expect(cart_item.dish.name).to eq("Burrito Burger")
  end
end