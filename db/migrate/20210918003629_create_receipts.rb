class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts, id: :uuid do |t|
      t.datetime :purchased_at

      t.references :store, type: :uuid
      t.references :household, type: :uuid

      t.timestamps
    end
  end
end
