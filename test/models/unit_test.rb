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
require "test_helper"

class UnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
