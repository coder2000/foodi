# == Schema Information
#
# Table name: stores
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Store < ApplicationRecord
  has_many :products
end
