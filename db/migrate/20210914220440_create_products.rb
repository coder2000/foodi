class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :barcode
      t.integer :min_stock_amount, default: 0
      t.jsonb :photo_data
      t.integer :default_due_days, default: 0
      t.integer :default_due_days_after_open, default: 0
      t.integer :default_due_days_after_freezing, default: 0
      t.integer :default_due_days_after_thawing, default: 0
      t.integer :due_type
      t.boolean :can_be_frozen
      t.integer :calories
      t.decimal :tare_weight, precision: 10, scale: 2
      t.boolean :enable_tare_weight
      t.boolean :active
      t.integer :unit_ratio

      t.references :location, type: :uuid
      t.references :parent, type: :uuid
      t.references :store, type: :uuid
      t.references :purchase_unit, type: :uuid
      t.references :inventory_unit, type: :uuid
      t.references :household, type: :uuid

      t.timestamps
    end
  end
end
