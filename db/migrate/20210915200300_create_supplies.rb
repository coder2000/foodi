class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies, id: :uuid do |t|
      t.integer :amount
      t.datetime :purchased_at
      t.datetime :due_at
      t.datetime :opened_at

      t.references :product
      t.references :location
      t.references :store

      t.timestamps
    end
  end
end
