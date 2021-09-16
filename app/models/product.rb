# == Schema Information
#
# Table name: products
#
#  id                              :uuid             not null, primary key
#  active                          :boolean
#  barcode                         :string
#  calories                        :integer
#  can_be_frozen                   :boolean
#  default_due_days                :integer          default(0)
#  default_due_days_after_freezing :integer          default(0)
#  default_due_days_after_open     :integer          default(0)
#  default_due_days_after_thawing  :integer          default(0)
#  description                     :text
#  due_type                        :integer
#  enable_tare_weight              :boolean
#  min_stock_amount                :integer          default(0)
#  name                            :string
#  photo_data                      :jsonb
#  tare_weight                     :decimal(10, 2)
#  unit_ratio                      :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  inventory_unit_id               :uuid
#  location_id                     :uuid
#  parent_id                       :uuid
#  purchase_unit_id                :uuid
#  store_id                        :uuid
#
# Indexes
#
#  index_products_on_inventory_unit_id  (inventory_unit_id)
#  index_products_on_location_id        (location_id)
#  index_products_on_parent_id          (parent_id)
#  index_products_on_purchase_unit_id   (purchase_unit_id)
#  index_products_on_store_id           (store_id)
#
class Product < ApplicationRecord
  belongs_to :location
  belongs_to :store
  belongs_to :inventory_unit, class_name: "Unit"
  belongs_to :purchase_unit, class_name: "Unit"
  belongs_to :parent, class_name: "Product", optional: true
end
