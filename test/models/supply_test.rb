# == Schema Information
#
# Table name: supplies
#
#  id           :uuid             not null, primary key
#  amount       :integer
#  due_at       :datetime
#  opened_at    :datetime
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :uuid
#  location_id  :uuid
#  product_id   :uuid
#  store_id     :uuid
#
# Indexes
#
#  index_supplies_on_household_id  (household_id)
#  index_supplies_on_location_id   (location_id)
#  index_supplies_on_product_id    (product_id)
#  index_supplies_on_store_id      (store_id)
#
require "test_helper"

class SupplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
