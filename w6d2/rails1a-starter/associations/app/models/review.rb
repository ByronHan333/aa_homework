# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  body          :text             not null
#  rating        :integer          not null
#  user_id       :bigint           not null
#  restaurant_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Review < ApplicationRecord
  belongs_to :reviewer,
  class_name: :User,
  foreign_key: :user_id

  belongs_to :restaurant,
  class_name: :Restaurant,
  foreign_key: :restaurant_id
end
