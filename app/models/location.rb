# == Schema Information
#
# Table name: locations
#
#  id           :uuid             not null, primary key
#  description  :text
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :uuid
#
# Indexes
#
#  index_locations_on_household_id  (household_id)
#
class Location < ApplicationRecord
  acts_as_tenant(:household)

  has_many :products
end
