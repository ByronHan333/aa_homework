# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string           not null
#  owner_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject(:restaurant) { Restaurant.find_by_name("Bobandys Burgers") }

  it "is associated with an owner" do
    expect(restaurant.owner.username).to eq("randy")
  end

  it "is associated with dishes" do
    expect(restaurant.dishes.first.name).to eq("Burrito Burger")
  end

  it "is associated with reviews" do
    expect(restaurant.reviews.first.rating).to eq(5)
  end

  it "is associated with customers reviewed" do
    expect(restaurant.customers_reviewed.first.username).to eq("donald")
  end

  it "can be successfully destroyed" do
    expect { restaurant.destroy }.not_to raise_error
  end
end