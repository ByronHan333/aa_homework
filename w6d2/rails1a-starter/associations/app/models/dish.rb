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
class Dish < ApplicationRecord
  belongs_to :restaurant

  has_many :cart_items,
  dependent: :destroy
end
