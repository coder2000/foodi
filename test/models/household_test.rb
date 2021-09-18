# == Schema Information
#
# Table name: households
#
#  id             :uuid             not null, primary key
#  city           :string
#  state          :string
#  street_address :string
#  subdomain      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
