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
class Restaurant < ApplicationRecord
  belongs_to :owner,
  class_name: :User,
  foreign_key: :owner_id

  has_many :dishes,
  dependent: :destroy

  has_many :reviews,
  dependent: :destroy

  has_many :customers_reviewed,
  through: :reviews,
  source: :reviewer

  


end
