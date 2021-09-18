class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies, id: :uuid do |t|
      t.integer :amount
      t.datetime :purchased_at
      t.datetime :due_at
      t.datetime :opened_at

      t.references :product, type: :uuid
      t.references :location, type: :uuid
      t.references :store, type: :uuid
      t.references :household, type: :uuid

      t.timestamps
    end
  end
end
