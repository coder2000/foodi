# == Schema Information
#
# Table name: stores
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
#  index_stores_on_household_id  (household_id)
#
require "test_helper"

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
