# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  belongs_to :customer,
  foreign_key: :user_id,
  class_name: :User

  has_many :cart_items,
  dependent: :destroy

  has_many :dishes,
  through: :cart_items,
  source: :dish
end
