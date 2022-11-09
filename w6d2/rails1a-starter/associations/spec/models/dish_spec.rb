# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  description   :text             not null
#  restaurant_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject(:dish) { Dish.first }

  it "is associated with a restaurant" do
    expect(dish.restaurant.name).to eq("Bobandys Burgers")
  end

  it "is associated with cart items" do
    expect(dish.cart_items.first.dish_id).to eq(dish.id)
  end

  it "can be successfully destroyed" do
    expect { dish.destroy }.not_to raise_error
  end
end