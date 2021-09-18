# == Schema Information
#
# Table name: units
#
#  id           :uuid             not null, primary key
#  description  :text
#  name         :string
#  plural       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :uuid
#
# Indexes
#
#  index_units_on_household_id  (household_id)
#
class Unit < ApplicationRecord
  acts_as_tenant(:household)
end
