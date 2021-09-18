# == Schema Information
#
# Table name: receipts
#
#  id           :uuid             not null, primary key
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  household_id :uuid
#  store_id     :uuid
#
# Indexes
#
#  index_receipts_on_household_id  (household_id)
#  index_receipts_on_store_id      (store_id)
#
class Receipt < ApplicationRecord
  acts_as_tenant(:household)
end
